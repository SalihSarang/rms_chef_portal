import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rms_shared_package/constants/db_constants.dart';
import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import 'package:rms_shared_package/enums/enums.dart';

abstract class ChefAuthRemoteDataSource {
  Future<StaffModel?> signIn(String email, String password);
  Future<void> signOut();
  Future<StaffModel?> getCurrentChef();
}

class ChefAuthRemoteDataSourceImpl implements ChefAuthRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  ChefAuthRemoteDataSourceImpl({required this.auth, required this.firestore});

  @override
  Future<StaffModel?> signIn(String email, String password) async {
    try {
      log('Attempting to sign in chef with email: $email');
      await auth.signInWithEmailAndPassword(email: email, password: password);

      final user = auth.currentUser;
      if (user == null) throw Exception('Authentication failed.');

      final docSnapshot = await firestore
          .collection(StaffDbConstants.staff)
          .doc(user.uid)
          .get();

      if (!docSnapshot.exists || docSnapshot.data() == null) {
        await auth.signOut();
        throw Exception('User record not found in system.');
      }

      final staff = StaffModel.fromMap(docSnapshot.data()!, docSnapshot.id);

      if (staff.role != UserRole.kitchen) {
        await auth.signOut();
        throw Exception(
          'Access Denied: This portal is only for kitchen staff.',
        );
      }

      if (!staff.isActive) {
        await auth.signOut();
        throw Exception(
          'Your account has been blocked. Please contact your manager.',
        );
      }

      log('Chef signed in successfully: ${staff.name}');
      return staff;
    } on FirebaseAuthException catch (e) {
      log('Firebase Auth Error: ${e.code}');
      throw _mapFirebaseAuthError(e.code);
    } catch (e) {
      log('Error signing in chef: $e');
      if (e is Exception) {
        rethrow;
      }
      throw Exception('An unexpected error occurred. Please try again.');
    }
  }

  String _mapFirebaseAuthError(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No account found with this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'network-request-failed':
        return 'Connection error. Please check your internet.';
      default:
        return 'Authentication failed. Please check your credentials.';
    }
  }

  @override
  Future<void> signOut() async {
    log('Signing out current chef');
    await auth.signOut();
  }

  @override
  Future<StaffModel?> getCurrentChef() async {
    final user = auth.currentUser;

    if (user == null) {
      log('No authenticated user found');
      return null;
    }
    log('Fetching details for user UID: ${user.uid}');
    final docSnapshot = await firestore
        .collection(StaffDbConstants.staff)
        .doc(user.uid)
        .get();

    if (!docSnapshot.exists || docSnapshot.data() == null) {
      log('Chef document does not exist for UID: ${user.uid}');
      return null;
    }

    final staff = StaffModel.fromMap(docSnapshot.data()!, docSnapshot.id);

    if (staff.role != UserRole.kitchen) {
      log('Authenticated user is not a chef. Real role: ${staff.role.name}');
      return null;
    }

    if (!staff.isActive) {
      log('Chef account is blocked: ${user.uid}');
      await auth.signOut();
      return null;
    }

    log('Chef document retrieved successfully');
    return staff;
  }
}

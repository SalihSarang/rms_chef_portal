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
      final chef = await getCurrentChef();
      if (chef == null) {
        log('User is not a valid chef. Signing out immediately.');
        await auth.signOut();
        throw Exception('User is not a valid chef.');
      }
      log('Chef signed in successfully: ${chef.name}');
      return chef;
    } catch (e) {
      log('Error signing in chef: $e');
      rethrow;
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

    log('Chef document retrieved successfully');
    return staff;
  }
}

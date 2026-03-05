import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rms_shared_package/constants/db_constants.dart';

abstract class HomeRemoteDataSource {
  Future<void> updateLastActiveStatus(String uid, DateTime time);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore firestore;

  HomeRemoteDataSourceImpl({required this.firestore});

  @override
  Future<void> updateLastActiveStatus(String uid, DateTime time) async {
    try {
      log('Attempting to update lastActive for user UID: $uid');
      await firestore.collection(StaffDbConstants.staff).doc(uid).update({
        'lastActive': time.millisecondsSinceEpoch,
      });
      log('Successfully updated lastActive to ${time.toIso8601String()}');
    } catch (e) {
      log('Error updating lastActive: $e');
      rethrow;
    }
  }
}

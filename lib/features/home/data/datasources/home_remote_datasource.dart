import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeRemoteDataSource {}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore firestore;

  HomeRemoteDataSourceImpl({required this.firestore});
}

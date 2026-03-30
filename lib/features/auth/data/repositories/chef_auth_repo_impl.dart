import 'dart:developer';
import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/chef_auth_remote_datasource.dart';

class ChefAuthRepoImpl implements AuthRepository {
  final ChefAuthRemoteDataSource remoteDataSource;

  ChefAuthRepoImpl({required this.remoteDataSource});

  @override
  Future<StaffModel?> signIn(String email, String password) async {
    try {
      return await remoteDataSource.signIn(email, password);
    } catch (e) {
      log('Error in ChefAuthRepoImpl.signIn: $e');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await remoteDataSource.signOut();
    } catch (e) {
      log('Error in ChefAuthRepoImpl.signOut: $e');
      rethrow;
    }
  }

  @override
  Future<StaffModel?> getCurrentChef() async {
    try {
      return await remoteDataSource.getCurrentChef();
    } catch (e) {
      log('Error in ChefAuthRepoImpl.getCurrentChef: $e');
      return null;
    }
  }
}

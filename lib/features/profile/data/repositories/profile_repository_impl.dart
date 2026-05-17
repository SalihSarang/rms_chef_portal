import 'package:chef_portal/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:chef_portal/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> updateLastActiveStatus(String uid, DateTime time) async {
    return await remoteDataSource.updateLastActiveStatus(uid, time);
  }
}

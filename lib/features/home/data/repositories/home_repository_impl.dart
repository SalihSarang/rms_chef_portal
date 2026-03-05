import 'package:chef_portal/features/home/data/datasources/home_remote_datasource.dart';
import 'package:chef_portal/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> updateLastActiveStatus(String uid, DateTime time) async {
    return await remoteDataSource.updateLastActiveStatus(uid, time);
  }
}

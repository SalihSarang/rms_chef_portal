import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:chef_portal/features/home/data/datasources/home_remote_datasource.dart';
import 'package:chef_portal/features/home/data/repositories/home_repository_impl.dart';
import 'package:chef_portal/features/home/domain/repositories/home_repository.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_bloc.dart';

final getIt = GetIt.instance;

// Home Feature DI
void homeDI() {
  // Data Sources
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );

  // Repositories
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: getIt<HomeRemoteDataSource>()),
  );

  // Blocs
  getIt.registerFactory<KdsBloc>(
    () => KdsBloc(homeRepository: getIt<HomeRepository>()),
  );
}

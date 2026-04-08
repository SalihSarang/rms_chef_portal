import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:chef_portal/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:chef_portal/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:chef_portal/features/profile/domain/repositories/profile_repository.dart';
import 'package:chef_portal/features/profile/domain/usecases/update_last_active_usecase.dart';
import 'package:chef_portal/features/profile/presentation/bloc/shift_bloc/shift_bloc.dart';

final getIt = GetIt.instance;

void profileDI() {
  // Data Sources
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );

  // Repositories
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remoteDataSource: getIt<ProfileRemoteDataSource>(),
    ),
  );

  // UseCases
  getIt.registerLazySingleton(
    () => UpdateLastActiveUseCase(getIt<ProfileRepository>()),
  );

  // Blocs
  getIt.registerFactory<ShiftBloc>(
    () => ShiftBloc(updateLastActiveUseCase: getIt<UpdateLastActiveUseCase>()),
  );
}

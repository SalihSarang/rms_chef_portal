import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chef_portal/core/di/injector.dart';
import 'package:chef_portal/features/auth/data/datasources/chef_auth_remote_datasource.dart';
import 'package:chef_portal/features/auth/data/repositories/chef_auth_repo_impl.dart';
import 'package:chef_portal/features/auth/domain/repositories/auth_repository.dart';
import 'package:chef_portal/features/auth/domain/usecases/check_auth_status.dart';
import 'package:chef_portal/features/auth/domain/usecases/sign_in_chef.dart';
import 'package:chef_portal/features/auth/domain/usecases/sign_out_chef.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_bloc.dart';

//Chef Auth DI
void chefAuthDI() {
  //Firebase Auth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Data Sources
  getIt.registerLazySingleton<ChefAuthRemoteDataSource>(
    () => ChefAuthRemoteDataSourceImpl(
      auth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
    ),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => ChefAuthRepoImpl(remoteDataSource: getIt<ChefAuthRemoteDataSource>()),
  );

  //Auth Usecases
  getIt.registerLazySingleton(() => SignInChef(getIt()));
  getIt.registerLazySingleton(() => SignOutChef(getIt()));
  getIt.registerLazySingleton(() => CheckAuthStatus(getIt()));

  //Register Bloc
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      signInChef: getIt(),
      signOutChef: getIt(),
      checkAuthStatus: getIt(),
    ),
  );
}

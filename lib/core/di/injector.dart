import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:chef_portal/core/di/chef_auth_di.dart';
import 'package:chef_portal/core/di/home_di.dart';

final getIt = GetIt.instance;

void setupDI() {
  //Firebase
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  //Chef Auth DI
  chefAuthDI();

  //Home DI
  homeDI();
}

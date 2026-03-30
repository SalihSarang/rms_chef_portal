import 'package:chef_portal/core/di/injector.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chef_portal/features/auth/presentation/pages/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/theme/app_theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => getIt<AuthBloc>()),
      ],
      child: MaterialApp(
        title: 'Chef Portal',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const AuthGate(),
      ),
    );
  }
}

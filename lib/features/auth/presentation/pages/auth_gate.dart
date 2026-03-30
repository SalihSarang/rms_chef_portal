import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_portal/core/di/injector.dart';
import 'package:chef_portal/features/home/presentation/bloc/shift_bloc.dart';
import 'package:chef_portal/features/home/presentation/pages/home_page.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'login_page.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(CheckAuthEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return BlocProvider<ShiftBloc>(
            create: (context) => getIt<ShiftBloc>(),
            child: HomePage(staff: state.user),
          );
        }

        if (state is AuthInitial ||
            (state is AuthLoading && state.isInitialCheck)) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return const LoginPage();
      },
    );
  }
}

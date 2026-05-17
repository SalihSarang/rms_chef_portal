import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_state.dart';
import 'package:chef_portal/features/auth/presentation/widgets/components/login_password_input.dart';

/// A specialized text field for entering the user's password during login,
/// including visibility toggle functionality.
class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => current is FormEditingState,
      builder: (context, state) {
        final isVisible = state is FormEditingState
            ? state.isPasswordVisible
            : false;

        return LoginPasswordInput(isVisible: isVisible);
      },
    );
  }
}

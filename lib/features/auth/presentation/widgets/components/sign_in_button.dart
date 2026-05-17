import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_state.dart';
import 'package:chef_portal/core/utils/snackbar_utils.dart';
import 'package:chef_portal/features/auth/presentation/widgets/components/login_submit_button.dart';

/// The primary action button for the login screen, handling form submission
/// and showing a loading indicator during authentication.
class SignInButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SignInButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          SnackBarUtils.showError(context, state.message);
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final isLoading = state is AuthLoading && !state.isInitialCheck;

          return LoginSubmitButton(isLoading: isLoading, formKey: formKey);
        },
      ),
    );
  }
}

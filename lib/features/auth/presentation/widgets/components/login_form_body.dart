import 'package:flutter/material.dart';
import 'auth_header.dart';
import 'login_email_field.dart';
import 'login_password_field.dart';
import 'forgot_password_button.dart';
import 'sign_in_button.dart';
import 'need_help_section.dart';

/// The main content of the login form, organized as a single column of
/// interactive components.
class LoginFormBody extends StatelessWidget {
  /// The form key required for validation by the [SignInButton].
  final GlobalKey<FormState> formKey;

  const LoginFormBody({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AuthHeader(
          icon: Icons.grid_view_rounded,
          title: 'Welcome Back',
          subtitle: 'Sign in to access your management dashboard.',
        ),
        const SizedBox(height: 32),
        const LoginEmailField(),
        const SizedBox(height: 20),
        const LoginPasswordField(),
        const SizedBox(height: 5),
        const ForgotPasswordButton(),
        const SizedBox(height: 15),
        SignInButton(formKey: formKey),
        const SizedBox(height: 10),
        const NeedHelpSection(),
      ],
    );
  }
}

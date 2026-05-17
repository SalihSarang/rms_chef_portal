import 'package:flutter/material.dart';
import 'auth_glass_container.dart';
import 'login_form_body.dart';

/// The primary visual canvas for the Login screen, containing the glass
/// container and the interactive form.
class LoginCanvas extends StatelessWidget {
  /// The form key required for validation.
  final GlobalKey<FormState> formKey;

  const LoginCanvas({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AuthGlassContainer(
            child: Form(
              key: formKey,
              child: LoginFormBody(formKey: formKey),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:chef_portal/core/utils/auth_button_styles.dart';
import 'package:chef_portal/core/utils/auth_handlers.dart';
import 'package:chef_portal/core/widgets/button_loading_indicator.dart';
import 'package:chef_portal/core/widgets/custom_text.dart';

/// The interactive submit button for the login form, handling the loading
/// state and the visual transition between text and a loading indicator.
class LoginSubmitButton extends StatelessWidget {
  final bool isLoading;
  final GlobalKey<FormState> formKey;

  const LoginSubmitButton({
    super.key,
    required this.isLoading,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading
          ? null
          : () => AuthHandlers.handleSignIn(context, formKey),
      style: AuthButtonStyles.primaryButtonStyle,
      child: isLoading
          ? const ButtonLoadingIndicator()
          : const CustomText(
              'Sign In',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
    );
  }
}

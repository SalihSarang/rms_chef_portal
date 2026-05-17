import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/primary_colors.dart';
import 'package:chef_portal/core/widgets/custom_text.dart';

/// A text button for initiating the "Forgot Password" flow.
class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const CustomText(
          'Forgot Password?',
          color: PrimaryColors.buttonActive,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          decorationColor: PrimaryColors.buttonActive,
        ),
      ),
    );
  }
}

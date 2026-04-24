import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/primary_colors.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

class AuthButtonStyles {
  static ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: PrimaryColors.buttonActive,
    foregroundColor: TextColors.primary,
    disabledBackgroundColor: PrimaryColors.buttonActive.withAlpha(128),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    padding: const EdgeInsets.symmetric(vertical: 16),
    elevation: 0,
  );
}

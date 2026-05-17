import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class AuthFieldStyles {
  static InputDecoration authInputDecoration({
    required String hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: TextColors.secondary.withValues(alpha: 0.5),
        fontSize: 14,
      ),
      filled: true,
      fillColor: NeutralColors.authFieldBackground,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: _buildBorder(NeutralColors.glassBorder),
      enabledBorder: _buildBorder(NeutralColors.glassBorder),
      focusedBorder: _buildBorder(PrimaryColors.defaultColor),
      suffixIcon: suffixIcon,
    );
  }

  static OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color),
    );
  }
}

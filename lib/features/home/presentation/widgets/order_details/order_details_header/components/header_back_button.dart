import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';

/// A circular back button with a consistent style used in the order details header.
class HeaderBackButton extends StatelessWidget {
  /// Callback function when the button is pressed.
  final VoidCallback onTap;

  const HeaderBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: NeutralColors.surface,
          shape: BoxShape.circle,
          border: Border.all(
            color: NeutralColors.border.withValues(alpha: 0.3),
          ),
        ),
        child: const Icon(
          Icons.arrow_back,
          color: NeutralColors.white,
          size: 20,
        ),
      ),
    );
  }
}

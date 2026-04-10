import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';

/// A specialized button used for switching between tabs in the [KdsAppBar].
///
/// It visually highlights itself when [isActive] is true to provide
/// clear feedback to the chef.
class KdsTabButton extends StatelessWidget {
  /// The label to display on the button.
  final String text;

  /// Whether this tab is currently selected.
  final bool isActive;

  /// Callback triggered when the tab is tapped.
  final VoidCallback onTap;

  const KdsTabButton({
    super.key,
    required this.text,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isActive ? NeutralColors.appBarBackground : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? NeutralColors.white : NeutralColors.icon,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

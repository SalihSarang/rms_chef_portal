import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A consistent loading indicator designed for use within buttons.
class ButtonLoadingIndicator extends StatelessWidget {
  const ButtonLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        color: TextColors.primary,
        strokeWidth: 2,
      ),
    );
  }
}

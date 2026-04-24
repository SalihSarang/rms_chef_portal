import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// The styled container for the addons and instructions box.
class ItemAddonsContainer extends StatelessWidget {
  final Widget child;

  const ItemAddonsContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20, left: 40),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: NeutralColors.background.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: NeutralColors.border.withValues(alpha: 0.3)),
      ),
      child: child,
    );
  }
}

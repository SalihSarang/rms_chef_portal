import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// The header for the addons section in an order item box.
class ItemAddonsHeader extends StatelessWidget {
  final String title;

  const ItemAddonsHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: NeutralColors.icon,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

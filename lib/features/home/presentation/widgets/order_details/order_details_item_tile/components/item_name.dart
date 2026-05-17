import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Displays the item name with optional strikethrough if prepared.
class ItemName extends StatelessWidget {
  final String name;
  final bool isPrepared;

  const ItemName({super.key, required this.name, required this.isPrepared});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(
            color: isPrepared
                ? TextColors.primary.withValues(alpha: 0.5)
                : TextColors.primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            decoration: isPrepared ? TextDecoration.lineThrough : null,
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}

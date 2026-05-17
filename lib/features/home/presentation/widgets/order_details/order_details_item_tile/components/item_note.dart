import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Displays a special instruction note for an order item.
class ItemNote extends StatelessWidget {
  final String instructions;

  const ItemNote({super.key, required this.instructions});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Note: ',
          style: TextStyle(
            color: NeutralColors.icon,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            instructions.toUpperCase(),
            style: const TextStyle(
              color: TextColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}

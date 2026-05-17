import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A badge displaying the portion size of an ordered item.
class ItemPortionBadge extends StatelessWidget {
  final String portionName;

  const ItemPortionBadge({super.key, required this.portionName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: NeutralColors.border.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        portionName.toUpperCase(),
        style: const TextStyle(
          color: TextColors.primary,
          fontSize: 10,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

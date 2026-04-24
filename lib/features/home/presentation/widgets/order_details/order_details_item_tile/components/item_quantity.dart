import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Displays the quantity multiplier for an ordered item.
class ItemQuantity extends StatelessWidget {
  final int quantity;

  const ItemQuantity({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          const Spacer(),
          Text(
            'x$quantity',
            style: const TextStyle(
              color: TextColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

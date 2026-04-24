import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Manages the display of the table identification and its vertical spacing.
class KdsOrderCardTableSection extends StatelessWidget {
  final String tableNumber;

  const KdsOrderCardTableSection({super.key, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Table $tableNumber',
          style: const TextStyle(
            color: TextColors.primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

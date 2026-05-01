import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Displays the table identification with a micro-label and a table icon.
class KdsOrderCardTableSection extends StatelessWidget {
  final String tableNumber;

  const KdsOrderCardTableSection({super.key, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'TABLE',
          style: TextStyle(
            color: NeutralColors.icon,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Table $tableNumber',
              style: const TextStyle(
                color: TextColors.primary,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.table_restaurant,
              color: NeutralColors.icon,
              size: 18,
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

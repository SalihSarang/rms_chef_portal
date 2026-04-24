import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'header_back_button.dart';

/// Combines the back navigation button and table identification text.
class HeaderIdentityRow extends StatelessWidget {
  final String tableNumber;

  const HeaderIdentityRow({super.key, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeaderBackButton(onTap: () => Navigator.of(context).pop()),
        const SizedBox(width: 20),
        Text(
          'TABLE $tableNumber',
          style: const TextStyle(
            color: TextColors.primary,
            fontSize: 28,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

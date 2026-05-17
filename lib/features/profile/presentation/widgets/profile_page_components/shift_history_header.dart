import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// The header for the shift history section.
class ShiftHistoryHeader extends StatelessWidget {
  const ShiftHistoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Shift History',
          style: TextStyle(
            color: TextColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

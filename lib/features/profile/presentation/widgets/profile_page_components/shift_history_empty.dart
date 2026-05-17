import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Displayed when there are no shift history records.
class ShiftHistoryEmpty extends StatelessWidget {
  const ShiftHistoryEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'No shift sessions yet.',
      style: TextStyle(color: NeutralColors.icon),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class ShiftHistoryHeader extends StatelessWidget {
  final int historyLength;

  const ShiftHistoryHeader({super.key, required this.historyLength});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'RECENT SHIFTS',
          style: TextStyle(
            color: NeutralColors.icon,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        Text(
          'Last ${historyLength.clamp(0, 3)} sessions',
          style: const TextStyle(color: NeutralColors.icon, fontSize: 10),
        ),
      ],
    );
  }
}

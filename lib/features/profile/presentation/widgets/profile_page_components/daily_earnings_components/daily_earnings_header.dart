import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class DailyEarningsHeader extends StatelessWidget {
  final int historyLength;

  const DailyEarningsHeader({super.key, required this.historyLength});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'DAILY EARNINGS',
          style: TextStyle(
            color: TextColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        if (historyLength > 0)
          Text(
            'Showing last $historyLength sessions',
            style: const TextStyle(color: TextColors.muted, fontSize: 12),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class ProfileStatsHeader extends StatelessWidget {
  const ProfileStatsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SHIFT STATISTICS',
          style: TextStyle(
            color: NeutralColors.icon,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

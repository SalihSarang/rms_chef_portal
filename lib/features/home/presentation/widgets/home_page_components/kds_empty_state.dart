import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';

class KdsEmptyState extends StatelessWidget {
  final bool showCompleted;

  const KdsEmptyState({super.key, required this.showCompleted});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            showCompleted ? Icons.history : Icons.restaurant,
            size: 64,
            color: NeutralColors.icon.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            showCompleted ? 'No completed orders yet' : 'No active orders',
            style: const TextStyle(color: NeutralColors.icon, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

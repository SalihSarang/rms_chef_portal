import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';

/// A reusable timer indicator that displays a clock icon and elapsed time.
class TimerIndicator extends StatelessWidget {
  /// The formatted elapsed time string (e.g., "08:45").
  final String elapsedTime;

  const TimerIndicator({super.key, required this.elapsedTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.access_time, color: TextColors.secondary, size: 16),
        const SizedBox(width: 8),
        Text(
          elapsedTime,
          style: const TextStyle(
            color: TextColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

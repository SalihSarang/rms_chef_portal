import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';
import 'timer_indicator.dart';

/// A stylized timer component used to display elapsed time in the order details header.
class HeaderTimer extends StatelessWidget {
  /// The formatted elapsed time string (e.g., "08:45").
  final String elapsedTime;

  const HeaderTimer({super.key, required this.elapsedTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const _TimerLabel(),
        const SizedBox(height: 4),
        _TimerContainer(elapsedTime: elapsedTime),
      ],
    );
  }
}

class _TimerLabel extends StatelessWidget {
  const _TimerLabel();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Elapsed',
      style: TextStyle(
        color: TextColors.secondary,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _TimerContainer extends StatelessWidget {
  final String elapsedTime;

  const _TimerContainer({required this.elapsedTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: NeutralColors.border.withValues(alpha: 0.3)),
      ),
      child: TimerIndicator(elapsedTime: elapsedTime),
    );
  }
}

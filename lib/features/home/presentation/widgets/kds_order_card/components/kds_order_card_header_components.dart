import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';

/// A styled badge that displays the current status of an order.
class StatusBadge extends StatelessWidget {
  final Color color;
  final String text;

  const StatusBadge({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/// Displays the order ID with a hash prefix.
class OrderIdText extends StatelessWidget {
  final String orderId;

  const OrderIdText({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Text(
          '#$orderId',
          style: const TextStyle(color: NeutralColors.icon, fontSize: 12),
        ),
      ],
    );
  }
}

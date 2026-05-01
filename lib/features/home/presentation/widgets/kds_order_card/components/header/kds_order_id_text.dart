import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';

/// Displays the order ID in a muted subtitle style.
class OrderIdText extends StatelessWidget {
  final String orderId;

  const OrderIdText({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Text(
      '#$orderId',
      style: const TextStyle(
        color: NeutralColors.icon,
        fontSize: 11,
        letterSpacing: 0.3,
      ),
    );
  }
}

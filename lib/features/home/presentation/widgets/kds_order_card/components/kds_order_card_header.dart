import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:chef_portal/features/home/presentation/widgets/kds_order_card/components/kds_order_timer.dart';
import 'package:rms_shared_package/enums/enums.dart';

/// The header section of the KDS order card.
/// 
/// Displays the current status badge, the order ID, and the elapsed/total timer.
class KdsOrderCardHeader extends StatelessWidget {
  final Color statusColor;
  final String statusText;
  final String orderId;
  final DateTime createdAt;
  /// The time the order was last updated, passed to the timer for final calculations.
  final DateTime updatedAt;
  /// The current status of the order, passed to the timer to control execution.
  final OrderStatus status;

  const KdsOrderCardHeader({
    super.key,
    required this.statusColor,
    required this.statusText,
    required this.orderId,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                statusText,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '#$orderId',
              style: const TextStyle(color: NeutralColors.icon, fontSize: 12),
            ),
          ],
        ),
        KdsOrderTimer(
          createdAt: createdAt,
          updatedAt: updatedAt,
          status: status,
        ),
      ],
    );
  }
}

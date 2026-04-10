import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'package:chef_portal/core/utils/kds_utils.dart';

import 'components/header_back_button.dart';
import 'components/header_status_indicator.dart';
import 'components/header_timer.dart';

/// The [OrderDetailsHeader] provides quick navigation and high-level status 
/// information for a specific order.
/// 
/// It includes:
/// - A back button for easy navigation.
/// - The Table Number prominently displayed.
/// - Current Order Status with color coding.
/// - Elapsed time since the order was placed.
class OrderDetailsHeader extends StatelessWidget {
  /// The order whose header information is being displayed.
  final OrderModel order;

  const OrderDetailsHeader({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    // Resolve human-readable status text from the utility.
    final statusText = KdsUtils.getStatusText(order.orderStatus);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: const BoxDecoration(color: NeutralColors.background),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Section: Navigation and Identification
          Row(
            children: [
              HeaderBackButton(onTap: () => Navigator.of(context).pop()),
              const SizedBox(width: 20),
              Text(
                'TABLE ${order.tableNumber}',
                style: const TextStyle(
                  color: NeutralColors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),

          // Right Section: Status Tracking and Time
          Row(
            children: [
              HeaderStatusIndicator(statusText: statusText),
              const SizedBox(width: 24),
              HeaderTimer(
                elapsedTime: KdsUtils.formatElapsedTime(order.createdAt),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

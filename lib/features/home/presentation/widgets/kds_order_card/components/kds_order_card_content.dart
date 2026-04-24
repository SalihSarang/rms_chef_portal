import 'package:flutter/material.dart';
import 'package:rms_shared_package/enums/enums.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'kds_order_card_body.dart';
import 'kds_order_card_action.dart';

/// The visual content of the KDS order card, including accent line and actions.
class KdsOrderCardContent extends StatelessWidget {
  final OrderModel order;
  final Color statusColor;
  final Function(OrderStatus) onStatusChange;

  const KdsOrderCardContent({
    super.key,
    required this.order,
    required this.statusColor,
    required this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          // Top Accent Line
          Container(height: 4, width: double.infinity, color: statusColor),

          KdsOrderCardBody(order: order, statusColor: statusColor),

          KdsOrderCardAction(
            orderStatus: order.orderStatus,
            statusColor: statusColor,
            onStatusChange: onStatusChange,
          ),
        ],
      ),
    );
  }
}

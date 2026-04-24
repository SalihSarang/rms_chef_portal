import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'package:chef_portal/core/utils/kds_utils.dart';
import 'kds_order_card_header.dart';

/// Combines the order card header and its vertical spacing.
class KdsOrderCardHeaderSection extends StatelessWidget {
  final OrderModel order;
  final Color statusColor;

  const KdsOrderCardHeaderSection({
    super.key,
    required this.order,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KdsOrderCardHeader(
          statusColor: statusColor,
          statusText: KdsUtils.getStatusText(order.orderStatus),
          orderId: order.id,
          createdAt: order.createdAt,
          updatedAt: order.updatedAt,
          status: order.orderStatus,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

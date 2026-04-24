import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/enums/enums.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'package:chef_portal/core/utils/kds_utils.dart';

import 'components/kds_order_card_content.dart';

/// A card that displays a single customer order and its current status.
class KdsOrderCard extends StatelessWidget {
  final OrderModel order;
  final Function(OrderStatus) onStatusChange;
  final VoidCallback? onTap;

  const KdsOrderCard({
    super.key,
    required this.order,
    required this.onStatusChange,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = KdsUtils.getStatusColor(order.orderStatus);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: NeutralColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: NeutralColors.border.withValues(alpha: 0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: NeutralColors.shadow.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: KdsOrderCardContent(
          order: order,
          statusColor: statusColor,
          onStatusChange: onStatusChange,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_shared_package/enums/enums.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'package:chef_portal/core/utils/kds_utils.dart';

import 'components/kds_order_card_header.dart';
import 'components/kds_order_card_items.dart';
import 'components/kds_order_card_action.dart';

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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              // Top Accent Line
              Container(height: 4, width: double.infinity, color: statusColor),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
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
                      Text(
                        'Table ${order.tableNumber}',
                        style: const TextStyle(
                          color: NeutralColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: KdsOrderCardItems(items: order.orderedMenu),
                      ),
                    ],
                  ),
                ),
              ),
              KdsOrderCardAction(
                orderStatus: order.orderStatus,
                statusColor: statusColor,
                onStatusChange: onStatusChange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

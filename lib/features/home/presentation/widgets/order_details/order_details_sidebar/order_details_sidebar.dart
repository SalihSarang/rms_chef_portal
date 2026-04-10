import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'package:rms_shared_package/enums/enums.dart';

import '../order_details_actions/order_details_actions.dart';
import 'components/sidebar_info_card.dart';

/// The sidebar for the Order Details screen, containing meta-information
/// and action buttons.
class OrderDetailsSidebar extends StatelessWidget {
  final OrderModel order;
  final Function(OrderStatus) onStatusChange;

  const OrderDetailsSidebar({
    super.key,
    required this.order,
    required this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: NeutralColors.background,
        border: Border(
          left: BorderSide(color: NeutralColors.border, width: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SidebarInfoCard(order: order),
          const Spacer(),
          OrderDetailsActions(order: order, onStatusChange: onStatusChange),
        ],
      ),
    );
  }
}

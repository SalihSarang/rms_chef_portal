import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'package:chef_portal/core/utils/kds_utils.dart';

import 'components/order_details_header_content.dart';

/// The [OrderDetailsHeader] provides quick navigation and high-level status
/// information for a specific order.
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
      child: OrderDetailsHeaderContent(order: order, statusText: statusText),
    );
  }
}

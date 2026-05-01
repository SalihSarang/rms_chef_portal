import 'package:flutter/material.dart';
import 'package:rms_shared_package/enums/enums.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'kds_order_card_body.dart';
import 'kds_order_card_action.dart';

/// The visual content of the KDS order card, including body and action button.
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
    return Column(
      children: [
        KdsOrderCardBody(order: order, statusColor: statusColor),
        KdsOrderCardAction(
          order: order,
          statusColor: statusColor,
          onStatusChange: onStatusChange,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'kds_order_card_header_section.dart';
import 'kds_order_card_table_section.dart';
import 'kds_order_card_items_section.dart';

/// The layout content for the KDS order card.
class KdsOrderCardBody extends StatelessWidget {
  final OrderModel order;
  final Color statusColor;

  const KdsOrderCardBody({
    super.key,
    required this.order,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            KdsOrderCardHeaderSection(order: order, statusColor: statusColor),
            KdsOrderCardTableSection(tableNumber: order.tableNumber),
            KdsOrderCardItemsSection(items: order.orderedMenu),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'header_identity_row.dart';
import 'header_status_row.dart';

/// The layout content for the order details header.
class OrderDetailsHeaderContent extends StatelessWidget {
  final OrderModel order;
  final String statusText;

  const OrderDetailsHeaderContent({
    super.key,
    required this.order,
    required this.statusText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeaderIdentityRow(tableNumber: order.tableNumber),
        HeaderStatusRow(statusText: statusText, createdAt: order.createdAt),
      ],
    );
  }
}

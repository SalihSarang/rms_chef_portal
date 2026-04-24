import 'package:flutter/material.dart';
import 'kds_order_card_header_components.dart';

/// A combined widget that displays the order's status badge
/// and the order ID in a single row.
class KdsOrderStatusInfo extends StatelessWidget {
  final Color statusColor;
  final String statusText;
  final String orderId;

  const KdsOrderStatusInfo({
    super.key,
    required this.statusColor,
    required this.statusText,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatusBadge(color: statusColor, text: statusText),
        OrderIdText(orderId: orderId),
      ],
    );
  }
}

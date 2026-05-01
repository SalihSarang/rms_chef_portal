import 'package:flutter/material.dart';
import 'kds_order_card_header_components.dart';

/// Displays the order's status badge only (order ID is shown separately below).
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
    return StatusBadge(color: statusColor, text: statusText);
  }
}

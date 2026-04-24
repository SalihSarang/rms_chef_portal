import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'info_item.dart';

/// A grid layout for displaying multiple InfoItem widgets.
class InfoGrid extends StatelessWidget {
  final OrderModel order;

  const InfoGrid({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InfoItem(label: 'Server', value: order.staffName),
            InfoItem(label: 'Guests', value: '${order.seatCount} '),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';

/// A card that displays essential order metadata such as the server name,
/// guest count, and order type.
class SidebarInfoCard extends StatelessWidget {
  final OrderModel order;

  const SidebarInfoCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: NeutralColors.surface.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Info',
            style: TextStyle(
              color: TextColors.secondary,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 16),
          _InfoGrid(order: order),
        ],
      ),
    );
  }
}

class _InfoGrid extends StatelessWidget {
  final OrderModel order;

  const _InfoGrid({required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _InfoItem(label: 'Server', value: order.staffName),
            _InfoItem(label: 'Guests', value: '${order.seatCount} '),
          ],
        ),
      ],
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const _InfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: TextColors.secondary, fontSize: 10),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: NeutralColors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

/// A single row representing an addon for an order item.
class AddonRow extends StatelessWidget {
  final AddOnsModel addon;

  const AddonRow({super.key, required this.addon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            addon.name,
            style: const TextStyle(
              color: TextColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '+\$${addon.price.toStringAsFixed(2)}',
            style: const TextStyle(color: NeutralColors.icon, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

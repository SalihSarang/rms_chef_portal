import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';
import 'item_header.dart';
import 'item_addons_box.dart';

/// The main content card for an order item, containing the header and addons.
class ItemContentCard extends StatelessWidget {
  final CartItemModel item;
  final Function(bool) onToggle;
  final bool enabled;

  const ItemContentCard({
    super.key,
    required this.item,
    required this.onToggle,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          // Use a subtle surface color with translucency for a modern feel.
          color: NeutralColors.surface.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item Main Info (Name, Portion, Quantity)
            ItemHeader(item: item, onToggle: onToggle, enabled: enabled),

            // Detailed Information Box (Add-ons, Notes)
            ItemAddonsBox(item: item),
          ],
        ),
      ),
    );
  }
}

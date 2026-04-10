import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';
import 'components/item_header.dart';
import 'components/item_addons_box.dart';

/// A premium tile component that displays an individual ordered item with its
/// details, add-ons, and special instructions.
class OrderDetailsItemTile extends StatelessWidget {
  /// The menu item to display.
  final CartItemModel item;

  /// Callback when the item's preparation status is toggled.
  final Function(bool) onToggle;

  const OrderDetailsItemTile({
    super.key,
    required this.item,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left Vertical Accent Line (Yellow)
          // Indicates the item's presence and status visually.
          Container(
            width: 3,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 16),

          // Main Interactive Card
          Expanded(
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
                  ItemHeader(item: item, onToggle: onToggle),

                  // Detailed Information Box (Add-ons, Notes)
                  ItemAddonsBox(item: item),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

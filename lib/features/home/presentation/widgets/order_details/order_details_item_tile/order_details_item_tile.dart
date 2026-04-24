import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';
import 'components/item_status_accent.dart';
import 'components/item_content_card.dart';

/// A premium tile component that displays an individual ordered item with its
/// details, add-ons, and special instructions.
class OrderDetailsItemTile extends StatelessWidget {
  /// The menu item to display.
  final CartItemModel item;

  /// Callback when the item's preparation status is toggled.
  final Function(bool) onToggle;

  /// Whether the item is interactive.
  final bool enabled;

  const OrderDetailsItemTile({
    super.key,
    required this.item,
    required this.onToggle,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ItemStatusAccent(),
          ItemContentCard(item: item, onToggle: onToggle, enabled: enabled),
        ],
      ),
    );
  }
}

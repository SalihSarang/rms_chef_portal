import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';
import 'item_checkbox.dart';
import 'item_name.dart';
import 'item_portion_badge.dart';
import 'item_quantity.dart';

/// The header component of an ordered item tile, containing identification
/// and quantity information.
class ItemHeader extends StatelessWidget {
  /// The menu item data.
  final CartItemModel item;

  /// Callback when the checkbox is toggled.
  final Function(bool) onToggle;

  /// Whether the item is interactive.
  final bool enabled;

  const ItemHeader({
    super.key,
    required this.item,
    required this.onToggle,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ItemCheckbox(
          isPrepared: item.isPrepared,
          onToggle: onToggle,
          enabled: enabled,
        ),
        ItemName(name: item.name, isPrepared: item.isPrepared),

        if (item.selectedPortion != null)
          ItemPortionBadge(portionName: item.selectedPortion!.name),
        ItemQuantity(quantity: item.quantity),
      ],
    );
  }
}

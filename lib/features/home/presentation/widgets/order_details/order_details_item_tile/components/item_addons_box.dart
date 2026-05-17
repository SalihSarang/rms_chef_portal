import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';
import 'item_addons_container.dart';
import 'item_addons_content.dart';

/// A nested information box that displays add-ons, prices, and special
/// instructions for an ordered item.
class ItemAddonsBox extends StatelessWidget {
  /// The menu item data.
  final CartItemModel item;

  const ItemAddonsBox({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // Only show if there are add-ons or special instructions.
    if (item.selectedAddOns.isEmpty &&
        (item.specialInstructions?.isEmpty ?? true)) {
      return const SizedBox.shrink();
    }

    return ItemAddonsContainer(child: ItemAddonsContent(item: item));
  }
}

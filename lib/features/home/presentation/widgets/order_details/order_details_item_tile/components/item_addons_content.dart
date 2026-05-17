import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';
import 'item_addons_header.dart';
import 'addon_row.dart';
import 'item_note.dart';

/// The layout content for the addons and instructions box.
class ItemAddonsContent extends StatelessWidget {
  final CartItemModel item;

  const ItemAddonsContent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Add-ons Section
        if (item.selectedAddOns.isNotEmpty) ...[
          const ItemAddonsHeader(title: 'Add-ons'),
          ...item.selectedAddOns.map((addon) => AddonRow(addon: addon)),
        ],

        // Special Instructions / Side Section
        if (item.specialInstructions?.isNotEmpty ?? false) ...[
          if (item.selectedAddOns.isNotEmpty) const SizedBox(height: 12),
          ItemNote(instructions: item.specialInstructions!),
        ],
      ],
    );
  }
}

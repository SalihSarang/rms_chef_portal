import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';
import 'kds_item_tile_components.dart';

class KdsItemTile extends StatelessWidget {
  final CartItemModel item;

  const KdsItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemHeader(item: item),
          if (item.specialInstructions != null &&
              item.specialInstructions!.isNotEmpty)
            SpecialInstruction(instructions: item.specialInstructions!),
          if (item.selectedPortion != null)
            PortionText(portionName: item.selectedPortion!.name),
          ...item.selectedAddOns.map(
            (addOn) => AddOnText(addOnName: addOn.name),
          ),
        ],
      ),
    );
  }
}

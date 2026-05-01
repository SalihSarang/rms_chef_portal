import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';
import 'components/kds_item_header.dart';
import 'components/kds_special_instruction.dart';
import 'components/kds_portion_text.dart';
import 'components/kds_add_on_text.dart';

class KdsItemTile extends StatelessWidget {
  final CartItemModel item;

  /// The status color used to style the quantity badge.
  final Color statusColor;

  /// The index of this tile in the list, used for alternating row backgrounds.
  final int index;

  const KdsItemTile({
    super.key,
    required this.item,
    required this.statusColor,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isEven = index.isEven;
    return Container(
      decoration: BoxDecoration(
        color: isEven
            ? Colors.white.withValues(alpha: 0.03)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemHeader(item: item, statusColor: statusColor),
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

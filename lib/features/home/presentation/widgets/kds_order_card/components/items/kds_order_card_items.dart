import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';
import 'item_tile/kds_item_tile.dart';

/// A list view that displays all [CartItemModel] items in an order,
/// with an item count chip header and alternating row backgrounds.
class KdsOrderCardItems extends StatelessWidget {
  /// The list of menu items to display.
  final List<CartItemModel> items;

  /// The status color used for the quantity badges on each tile.
  final Color statusColor;

  const KdsOrderCardItems({
    super.key,
    required this.items,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Item count chip
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: NeutralColors.border.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${items.length} ${items.length == 1 ? 'item' : 'items'}',
              style: const TextStyle(
                color: NeutralColors.icon,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return KdsItemTile(
                item: items[index],
                statusColor: statusColor,
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}

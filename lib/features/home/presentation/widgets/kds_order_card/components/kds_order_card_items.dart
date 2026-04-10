import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';
import 'kds_item_tile.dart';

/// A list view that displays all [CartItemModel] items in an order.
class KdsOrderCardItems extends StatelessWidget {
  /// The list of menu items to display.
  final List<CartItemModel> items;

  const KdsOrderCardItems({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return KdsItemTile(item: items[index]);
      },
    );
  }
}

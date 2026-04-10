import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';
import 'order_details_item_tile/order_details_item_tile.dart';

class OrderDetailsItems extends StatelessWidget {
  final List<CartItemModel> items;
  final Function(int index, bool isPrepared) onToggle;

  const OrderDetailsItems({
    super.key,
    required this.items,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) => OrderDetailsItemTile(
        key: ValueKey('order_item_$index'),
        item: items[index],
        onToggle: (isPrepared) => onToggle(index, isPrepared),
      ),
    );
  }
}

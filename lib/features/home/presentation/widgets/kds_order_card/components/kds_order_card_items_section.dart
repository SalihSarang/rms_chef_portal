import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';
import 'kds_order_card_items.dart';

/// Encapsulates the expanded list of ordered menu items.
class KdsOrderCardItemsSection extends StatelessWidget {
  final List<CartItemModel> items;

  const KdsOrderCardItemsSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: KdsOrderCardItems(items: items));
  }
}

import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';
import 'kds_item_tile.dart';

class KdsOrderCardItems extends StatefulWidget {
  final List<CartItemModel> items;

  const KdsOrderCardItems({super.key, required this.items});

  @override
  State<KdsOrderCardItems> createState() => _KdsOrderCardItemsState();
}

class _KdsOrderCardItemsState extends State<KdsOrderCardItems> {
  final Set<int> _checkedIndices = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return KdsItemTile(
          item: widget.items[index],
          isChecked: _checkedIndices.contains(index),
          onChanged: (val) {
            setState(() {
              if (val == true) {
                _checkedIndices.add(index);
              } else {
                _checkedIndices.remove(index);
              }
            });
          },
        );
      },
    );
  }
}

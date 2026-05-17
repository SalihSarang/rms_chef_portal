import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'components/kds_order_grid_item.dart';

/// A responsive grid that displays multiple [KdsOrderCard] widgets.
///
/// The grid automatically adjusts its [crossAxisCount] based on the
/// screen width to support both tablets and desktop displays.
class KdsOrderGrid extends StatelessWidget {
  /// The list of orders to display in the grid.
  final List<OrderModel> orders;

  const KdsOrderGrid({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 3;
        if (constraints.maxWidth < 800) {
          crossAxisCount = 1;
        } else if (constraints.maxWidth < 1200) {
          crossAxisCount = 2;
        }

        return GridView.builder(
          padding: const EdgeInsets.all(24),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 1.1,
          ),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return KdsOrderGridItem(order: order);
          },
        );
      },
    );
  }
}

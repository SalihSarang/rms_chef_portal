import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'package:chef_portal/features/home/domain/models/consolidated_item_model.dart';

/// Displays a consolidated list of items aggregated across multiple orders.
class KdsConsolidatedItemView extends StatelessWidget {
  final List<OrderModel> orders;

  const KdsConsolidatedItemView({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    final consolidatedItems = ConsolidatedItemModel.fromOrders(orders);

    if (consolidatedItems.isEmpty) {
      return const Center(
        child: Text(
          'No items to display',
          style: TextStyle(color: NeutralColors.icon, fontSize: 16),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          mainAxisExtent: 120,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: consolidatedItems.length,
        itemBuilder: (context, index) {
          final item = consolidatedItems[index];
          return Container(
            decoration: BoxDecoration(
              color: NeutralColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: NeutralColors.border),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Quantity Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: PrimaryColors.defaultColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: PrimaryColors.defaultColor.withValues(alpha: 0.3)),
                  ),
                  child: Text(
                    '${item.totalQuantity}x',
                    style: const TextStyle(
                      color: PrimaryColors.defaultColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Item Name
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                          color: TextColors.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'From ${item.sourceItems.length} orders',
                        style: const TextStyle(
                          color: TextColors.secondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

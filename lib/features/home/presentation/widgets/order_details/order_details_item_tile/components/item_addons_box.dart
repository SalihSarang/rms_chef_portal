import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';

/// A nested information box that displays add-ons, prices, and special 
/// instructions for an ordered item.
class ItemAddonsBox extends StatelessWidget {
  /// The menu item data.
  final CartItemModel item;

  const ItemAddonsBox({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // Only show if there are add-ons or special instructions.
    if (item.selectedAddOns.isEmpty && (item.specialInstructions?.isEmpty ?? true)) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20, left: 40),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: NeutralColors.background.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: NeutralColors.border.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add-ons Section
          if (item.selectedAddOns.isNotEmpty) ...[
            const Text(
              'Add-ons',
              style: TextStyle(
                color: NeutralColors.icon,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            ...item.selectedAddOns.map((addon) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    addon.name,
                    style: const TextStyle(
                      color: NeutralColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '+\$${addon.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: NeutralColors.icon,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )),
          ],
          
          // Special Instructions / Side Section
          if (item.specialInstructions?.isNotEmpty ?? false) ...[
            if (item.selectedAddOns.isNotEmpty) const SizedBox(height: 12),
            Row(
              children: [
                const Text(
                  'Note: ',
                  style: TextStyle(
                    color: NeutralColors.icon,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    item.specialInstructions!.toUpperCase(),
                    style: const TextStyle(
                      color: NeutralColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

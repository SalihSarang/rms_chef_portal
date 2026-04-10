import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';

/// The header component of an ordered item tile, containing identification
/// and quantity information.
class ItemHeader extends StatelessWidget {
  /// The menu item data.
  final CartItemModel item;

  /// Callback when the checkbox is toggled.
  final Function(bool) onToggle;

  const ItemHeader({super.key, required this.item, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Standard Checkbox
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: item.isPrepared,
            onChanged: (value) => onToggle(value ?? false),
            activeColor: Colors.blue,
            checkColor: NeutralColors.white,
            visualDensity: VisualDensity.compact,
            side: BorderSide(
              color: item.isPrepared
                  ? Colors.blue
                  : NeutralColors.border.withValues(alpha: 0.5),
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(width: 16),

        // Item Name
        Text(
          item.name,
          style: TextStyle(
            color: item.isPrepared
                ? NeutralColors.white.withValues(alpha: 0.5)
                : NeutralColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            decoration: item.isPrepared ? TextDecoration.lineThrough : null,
          ),
        ),
        const SizedBox(width: 12),

        // Portion Badge (e.g., FULL, HALF)
        if (item.selectedPortion != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: NeutralColors.border.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              item.selectedPortion!.name.toUpperCase(),
              style: const TextStyle(
                color: NeutralColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

        const Spacer(),

        // Quantity Indicator
        Text(
          'x${item.quantity}',
          style: const TextStyle(
            color: NeutralColors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

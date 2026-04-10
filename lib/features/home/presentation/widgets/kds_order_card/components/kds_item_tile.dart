import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/app_colors/status_colors.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';

class KdsItemTile extends StatelessWidget {
  final CartItemModel item;

  const KdsItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${item.quantity}x',
                style: const TextStyle(
                  color: NeutralColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item.name,
                  style: const TextStyle(
                    color: NeutralColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          if (item.specialInstructions != null &&
              item.specialInstructions!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Text(
                '-- ${item.specialInstructions}',
                style: const TextStyle(
                  color: StatusColors.pending,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          if (item.selectedPortion != null)
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Text(
                '-- ${item.selectedPortion!.name}',
                style: const TextStyle(color: NeutralColors.icon, fontSize: 12),
              ),
            ),
          ...item.selectedAddOns.map(
            (addOn) => Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Text(
                '-- ${addOn.name}',
                style: const TextStyle(color: NeutralColors.icon, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

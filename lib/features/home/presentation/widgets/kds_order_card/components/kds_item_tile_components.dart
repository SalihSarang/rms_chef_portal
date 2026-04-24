import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';

/// The header row for a KDS item, showing quantity and name.
class ItemHeader extends StatelessWidget {
  final CartItemModel item;
  const ItemHeader({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${item.quantity}x',
          style: const TextStyle(
            color: TextColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            item.name,
            style: const TextStyle(
              color: TextColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

/// Displays special instructions for an item.
class SpecialInstruction extends StatelessWidget {
  final String instructions;
  const SpecialInstruction({super.key, required this.instructions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Text(
        '-- $instructions',
        style: const TextStyle(
          color: StatusColors.pending,
          fontSize: 12,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

/// Displays the selected portion for an item.
class PortionText extends StatelessWidget {
  final String portionName;
  const PortionText({super.key, required this.portionName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Text(
        '-- $portionName',
        style: const TextStyle(color: NeutralColors.icon, fontSize: 12),
      ),
    );
  }
}

/// Displays a selected add-on for an item.
class AddOnText extends StatelessWidget {
  final String addOnName;
  const AddOnText({super.key, required this.addOnName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Text(
        '-- $addOnName',
        style: const TextStyle(color: NeutralColors.icon, fontSize: 12),
      ),
    );
  }
}

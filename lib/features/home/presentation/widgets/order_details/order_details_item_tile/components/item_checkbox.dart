import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A stylized checkbox for marking an item as prepared.
class ItemCheckbox extends StatelessWidget {
  final bool isPrepared;
  final ValueChanged<bool> onToggle;
  final bool enabled;

  const ItemCheckbox({
    super.key,
    required this.isPrepared,
    required this.onToggle,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: isPrepared,
            onChanged: enabled ? (value) => onToggle(value ?? false) : null,
            activeColor: NeutralColors.surface,
            checkColor: TextColors.primary,
            visualDensity: VisualDensity.compact,
            side: BorderSide(
              color: isPrepared
                  ? PrimaryColors.defaultColor
                  : NeutralColors.border.withValues(alpha: 0.5),
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:chef_portal/core/widgets/custom_text.dart';

/// A reusable tile for displaying a detail field with an icon.
class DetailTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const DetailTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: NeutralColors.icon, size: 18),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  label,
                  color: NeutralColors.icon,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 2),
                CustomText(
                  value,
                  color: TextColors.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

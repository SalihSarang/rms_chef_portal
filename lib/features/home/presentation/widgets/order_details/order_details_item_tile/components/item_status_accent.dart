import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A vertical accent line that indicates the item's status.
class ItemStatusAccent extends StatelessWidget {
  const ItemStatusAccent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 3,
          decoration: BoxDecoration(
            color: StatusColors.pending,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

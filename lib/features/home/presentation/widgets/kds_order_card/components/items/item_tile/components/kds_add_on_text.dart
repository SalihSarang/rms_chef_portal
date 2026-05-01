import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Displays a selected add-on for an item.
class AddOnText extends StatelessWidget {
  final String addOnName;
  const AddOnText({super.key, required this.addOnName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 42, top: 2),
      child: Text(
        '·  $addOnName',
        style: const TextStyle(color: NeutralColors.icon, fontSize: 12),
      ),
    );
  }
}

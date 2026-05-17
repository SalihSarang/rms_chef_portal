import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Displays the selected portion for an item.
class PortionText extends StatelessWidget {
  final String portionName;
  const PortionText({super.key, required this.portionName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 42, top: 2),
      child: Text(
        '·  $portionName',
        style: const TextStyle(color: NeutralColors.icon, fontSize: 12),
      ),
    );
  }
}

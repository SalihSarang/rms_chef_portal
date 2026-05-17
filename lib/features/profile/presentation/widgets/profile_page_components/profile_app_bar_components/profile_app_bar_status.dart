import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class ProfileAppBarStatus extends StatelessWidget {
  final String statusLabel;

  const ProfileAppBarStatus({super.key, required this.statusLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            color: NeutralColors.icon,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          statusLabel,
          style: const TextStyle(color: NeutralColors.icon, fontSize: 12),
        ),
      ],
    );
  }
}

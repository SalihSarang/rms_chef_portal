import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';

class NeedHelpSection extends StatelessWidget {
  const NeedHelpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.help_outline, color: NeutralColors.icon, size: 14),
          SizedBox(width: 5),
          Text(
            'Need Help?',
            style: TextStyle(color: NeutralColors.icon, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

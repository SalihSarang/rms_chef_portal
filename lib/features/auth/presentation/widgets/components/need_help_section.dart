import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:chef_portal/core/widgets/custom_text.dart';

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
          CustomText('Need Help?', color: NeutralColors.icon, fontSize: 13),
        ],
      ),
    );
  }
}

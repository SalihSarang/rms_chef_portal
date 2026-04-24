import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:chef_portal/features/auth/presentation/widgets/components/auth_header_icon.dart';
import 'package:chef_portal/core/widgets/custom_text.dart';

class AuthHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const AuthHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthHeaderIcon(icon: icon),
        const SizedBox(height: 24),
        CustomText.header(title, textAlign: TextAlign.center),
        const SizedBox(height: 8),
        CustomText(
          subtitle,
          textAlign: TextAlign.center,
          color: NeutralColors.icon,
        ),
      ],
    );
  }
}

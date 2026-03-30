import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';

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
        Center(
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: NeutralColors.authFieldBackground,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: NeutralColors.glassBorder),
            ),
            child: Icon(icon, color: NeutralColors.icon, size: 24),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: NeutralColors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(color: NeutralColors.icon, fontSize: 14),
        ),
      ],
    );
  }
}

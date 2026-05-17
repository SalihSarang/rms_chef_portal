import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// The centralized icon container used in authentication headers,
/// featuring a glassmorphic-style border and background.
class AuthHeaderIcon extends StatelessWidget {
  final IconData icon;

  const AuthHeaderIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}

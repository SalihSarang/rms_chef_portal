import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';

class AuthGlassContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final EdgeInsets padding;

  const AuthGlassContainer({
    super.key,
    required this.child,
    this.width = 400,
    this.padding = const EdgeInsets.all(40),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
        child: Container(
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            color: NeutralColors.glassBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: NeutralColors.glassBorder),
          ),
          child: child,
        ),
      ),
    );
  }
}

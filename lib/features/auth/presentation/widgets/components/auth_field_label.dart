import 'package:chef_portal/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class AuthFieldLabel extends StatelessWidget {
  final String label;
  final Widget? suffix;

  const AuthFieldLabel({super.key, required this.label, this.suffix});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          label,
          color: TextColors.secondary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        ?suffix,
      ],
    );
  }
}

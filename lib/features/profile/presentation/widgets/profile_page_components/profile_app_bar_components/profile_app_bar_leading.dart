import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class ProfileAppBarLeading extends StatelessWidget {
  const ProfileAppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: TextColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        const Text(
          'Staff Profile',
          style: TextStyle(
            color: TextColors.primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

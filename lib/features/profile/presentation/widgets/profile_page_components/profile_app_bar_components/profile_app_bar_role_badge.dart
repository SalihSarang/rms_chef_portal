import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class ProfileAppBarRoleBadge extends StatelessWidget {
  final StaffModel staff;

  const ProfileAppBarRoleBadge({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: PrimaryColors.defaultColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        staff.role.name.toUpperCase(),
        style: const TextStyle(
          color: PrimaryColors.defaultColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

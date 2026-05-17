import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:chef_portal/core/widgets/custom_text.dart';

class ProfileSidebarHeader extends StatelessWidget {
  final StaffModel staff;

  const ProfileSidebarHeader({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: NeutralColors.surface,
          backgroundImage: staff.avatar.isNotEmpty
              ? NetworkImage(staff.avatar)
              : null,
          child: staff.avatar.isEmpty
              ? const Icon(Icons.person, size: 60, color: NeutralColors.icon)
              : null,
        ),
        const SizedBox(height: 24),
        CustomText.header(staff.name, fontSize: 22),
        const SizedBox(height: 8),
        CustomText(
          staff.role.name.toUpperCase(),
          color: NeutralColors.icon,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}

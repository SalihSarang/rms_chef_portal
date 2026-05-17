import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'components/detail_tile.dart';

/// Section displaying personal details of the chef.
class ProfileDetailsSection extends StatelessWidget {
  final StaffModel staff;

  const ProfileDetailsSection({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PERSONAL DETAILS',
          style: TextStyle(
            color: NeutralColors.icon,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        DetailTile(
          icon: Icons.email_outlined,
          label: 'Email Address',
          value: staff.email.isNotEmpty ? staff.email : 'Not provided',
        ),
        DetailTile(
          icon: Icons.phone_outlined,
          label: 'Phone Number',
          value: staff.phoneNumber.isNotEmpty
              ? staff.phoneNumber
              : 'Not provided',
        ),
        DetailTile(
          icon: Icons.badge_outlined,
          label: 'Designation',
          value: staff.role.name.toUpperCase(),
        ),
      ],
    );
  }
}

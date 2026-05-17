import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class ProfileAppBarUserIdentity extends StatelessWidget {
  final StaffModel staff;

  const ProfileAppBarUserIdentity({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 14,
          backgroundImage: staff.avatar.isNotEmpty
              ? NetworkImage(staff.avatar)
              : null,
          child: staff.avatar.isEmpty
              ? const Icon(Icons.person, size: 14)
              : null,
        ),
        const SizedBox(width: 12),
        Text(
          staff.name,
          style: const TextStyle(
            color: TextColors.primary,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

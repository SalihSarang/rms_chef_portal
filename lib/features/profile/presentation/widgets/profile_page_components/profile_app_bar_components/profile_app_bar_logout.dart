import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:chef_portal/features/profile/presentation/utils/profile_utils.dart';

class ProfileAppBarLogout extends StatelessWidget {
  const ProfileAppBarLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: TextButton.icon(
        onPressed: () => ProfileUtils.handleLogout(context),
        icon: const Icon(Icons.logout, size: 16, color: SemanticColors.error),
        label: const Text(
          'Logout',
          style: TextStyle(color: SemanticColors.error, fontSize: 14),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_shared_package/models/staff_model/staff_model.dart';

/// The top header card of the profile screen.
///
/// Displays the chef's avatar, name, and role in a prominent,
/// stylized container.
class ProfileHeader extends StatelessWidget {
  /// The [StaffModel] containing the identity details of the chef.
  final StaffModel staff;

  const ProfileHeader({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: NeutralColors.background,
              borderRadius: BorderRadius.circular(16),
            ),
            child: staff.avatar.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(staff.avatar, fit: BoxFit.cover),
                  )
                : const Center(
                    child: Text(
                      "IMG",
                      style: TextStyle(
                        color: NeutralColors.icon,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
          const SizedBox(height: 20),
          Text(
            staff.name,
            style: const TextStyle(
              color: NeutralColors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            staff.role.name.toUpperCase(),
            style: const TextStyle(
              color: NeutralColors.icon,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

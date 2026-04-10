import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/status_colors.dart';

/// A specialized action button for ending the shift and logging out.
///
/// It features a distinct orange border and is placed at the bottom
/// of the profile dashboard for high visibility.
class ProfileLogoutButton extends StatelessWidget {
  /// Callback triggered when the logout button is tapped.
  final VoidCallback onLogout;

  const ProfileLogoutButton({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLogout,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: StatusColors.pending.withValues(alpha: 0.5),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: StatusColors.pending, size: 20),
            SizedBox(width: 16),
            Text(
              "END SHIFT / LOGOUT",
              style: TextStyle(
                color: StatusColors.pending,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

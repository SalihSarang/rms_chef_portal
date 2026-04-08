import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: NeutralColors.background,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: NeutralColors.white),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        const Icon(Icons.notifications_none, color: NeutralColors.white),
        const SizedBox(width: 16),
        const CircleAvatar(
          radius: 16,
          backgroundColor: NeutralColors.surface,
          child: Icon(
            Icons.person_outline,
            size: 20,
            color: NeutralColors.white,
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

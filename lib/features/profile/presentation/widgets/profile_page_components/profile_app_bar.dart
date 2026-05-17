import 'package:chef_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_state.dart';
import 'package:chef_portal/features/profile/presentation/bloc/shift_bloc/shift_bloc.dart';
import 'package:chef_portal/features/profile/presentation/bloc/shift_bloc/shift_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';

import 'profile_app_bar_components/profile_app_bar_leading.dart';
import 'profile_app_bar_components/profile_app_bar_logout.dart';
import 'profile_app_bar_components/profile_app_bar_role_badge.dart';
import 'profile_app_bar_components/profile_app_bar_status.dart';
import 'profile_app_bar_components/profile_app_bar_user_identity.dart';

/// A custom [AppBar] tailored for the [ProfilePage].
///
/// It uses a modular architecture where each section is a standalone widget
/// following the "Table of Contents" declarative pattern.
class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    final shiftState = context.watch<ShiftBloc>().state;
    final staff = authState is Authenticated ? authState.user : null;
    final statusLabel = shiftState.data?.statusLabel ?? 'Not Started';

    return AppBar(
      backgroundColor: NeutralColors.surface,
      elevation: 0,
      leadingWidth: 200,
      leading: const ProfileAppBarLeading(),
      centerTitle: true,
      title: staff == null
          ? null
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileAppBarUserIdentity(staff: staff),
                const SizedBox(width: 8),
                ProfileAppBarRoleBadge(staff: staff),
                const SizedBox(width: 12),
                ProfileAppBarStatus(statusLabel: statusLabel),
              ],
            ),
      actions: const [ProfileAppBarLogout()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

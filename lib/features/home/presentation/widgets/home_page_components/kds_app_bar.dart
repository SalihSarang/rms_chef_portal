import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/app_colors/status_colors.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_bloc.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_event.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_state.dart';
import 'kds_tab_button.dart';

/// The custom AppBar for the KDS home screen.
///
/// It contains the station title, the tab selector for switching between
/// Active and Completed orders, and the profile access icon.
class KdsAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The current state of the KDS system, used to highlight the active tab.
  final KdsState state;

  /// Callback triggered when the user taps on the profile icon.
  final VoidCallback? onProfileTap;

  const KdsAppBar({super.key, required this.state, this.onProfileTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: NeutralColors.background,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: StatusColors.preparing.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.grid_view_rounded,
            color: StatusColors.preparing,
          ),
        ),
      ),
      title: const Text(
        'KDS Station',
        style: TextStyle(
          color: NeutralColors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
      actions: [
        Container(
          height: 40,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: NeutralColors.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              KdsTabButton(
                text: 'ACTIVE ORDERS',
                isActive: !state.showCompleted,
                onTap: () => context.read<KdsBloc>().add(
                  const ToggleKdsTabEvent(showCompleted: false),
                ),
              ),
              KdsTabButton(
                text: 'COMPLETED',
                isActive: state.showCompleted,
                onTap: () => context.read<KdsBloc>().add(
                  const ToggleKdsTabEvent(showCompleted: true),
                ),
              ),
            ],
          ),
        ),
        const Icon(Icons.notifications_none, color: NeutralColors.white),
        const SizedBox(width: 16),
        InkWell(
          onTap: onProfileTap,
          borderRadius: BorderRadius.circular(16),
          child: const CircleAvatar(
            radius: 16,
            backgroundColor: NeutralColors.surface,
            child: Icon(
              Icons.person_outline,
              size: 20,
              color: NeutralColors.white,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

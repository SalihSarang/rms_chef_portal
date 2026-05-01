import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_state.dart';
import 'kds_app_bar_components.dart';

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
      leading: const StationIcon(),
      title: const RmsAppBarTitle('KDS Station'),
      centerTitle: false,
      actions: [
        OrderTypeTabs(state: state),
        AppBarActions(onProfileTap: onProfileTap),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

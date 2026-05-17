import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_bloc.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_event.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_state.dart';
import 'kds_tab_button.dart';

/// The leading icon for the KDS station.
class StationIcon extends StatelessWidget {
  const StationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
      ),
    );
  }
}

/// The tab selector for switching between ACTIVE and COMPLETED orders.
class OrderTypeTabs extends StatelessWidget {
  final KdsState state;

  const OrderTypeTabs({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

/// The tab selector for switching between Grid View and Consolidated Item View.
class ViewModeTabs extends StatelessWidget {
  final KdsState state;

  const ViewModeTabs({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: NeutralColors.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          KdsTabButton(
            text: 'ORDER VIEW',
            isActive: state.viewMode == KdsViewMode.grid,
            onTap: () => context.read<KdsBloc>().add(
              const ToggleKdsViewModeEvent(viewMode: KdsViewMode.grid),
            ),
          ),
          KdsTabButton(
            text: 'ITEM VIEW',
            isActive: state.viewMode == KdsViewMode.consolidated,
            onTap: () => context.read<KdsBloc>().add(
              const ToggleKdsViewModeEvent(viewMode: KdsViewMode.consolidated),
            ),
          ),
        ],
      ),
    );
  }
}

/// The action buttons on the right side of the KDS AppBar.
class AppBarActions extends StatelessWidget {
  final VoidCallback? onProfileTap;

  const AppBarActions({super.key, this.onProfileTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.notifications_none, color: TextColors.primary),
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
              color: TextColors.primary,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

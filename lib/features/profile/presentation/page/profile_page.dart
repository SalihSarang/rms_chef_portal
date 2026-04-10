import 'package:chef_portal/core/utils/kds_utils.dart';
import 'package:chef_portal/features/profile/presentation/widgets/profile_page_components/profile_app_bar.dart';
import 'package:chef_portal/features/profile/presentation/widgets/profile_page_components/profile_header.dart';
import 'package:chef_portal/features/profile/presentation/widgets/profile_page_components/profile_logout_button.dart';
import 'package:chef_portal/features/profile/presentation/widgets/profile_page_components/profile_shift_button.dart';
import 'package:chef_portal/features/profile/presentation/widgets/profile_page_components/state_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_bloc.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_state.dart';
import 'package:rms_shared_package/enums/enums.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_event.dart';

/// The main dashboard for the chef's profile.
///
/// It displays personal information, shift history, performance metrics (completed orders),
/// and provides actions for shift management and logging out.
class ProfilePage extends StatelessWidget {
  /// The [StaffModel] of the currently logged-in chef.
  final StaffModel staff;

  const ProfilePage({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: const ProfileAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                ProfileHeader(staff: staff),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        icon: Icons.access_time,
                        label: "SHIFT START",
                        value: KdsUtils.formatTime(staff.lastActive),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: BlocBuilder<KdsBloc, KdsState>(
                        builder: (context, state) {
                          final completedCount = state.orders
                              .where(
                                (o) =>
                                    o.orderStatus == OrderStatus.ready ||
                                    o.orderStatus == OrderStatus.served ||
                                    o.orderStatus == OrderStatus.completed,
                              )
                              .length;
                          return StatCard(
                            icon: Icons.check_circle_outline,
                            label: "COMPLETED ORDERS",
                            value: completedCount.toString().padLeft(2, '0'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                ProfileShiftButton(staffId: staff.id),
                const SizedBox(height: 16),

                ProfileLogoutButton(
                  onLogout: () {
                    context.read<AuthBloc>().add(SignOutEvent());
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

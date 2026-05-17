import 'package:chef_portal/features/profile/presentation/widgets/profile_page_components/profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import '../bloc/shift_bloc/shift_state.dart';
import '../bloc/shift_bloc/shift_bloc.dart';
import '../widgets/profile_page_components/profile_dashboard_view.dart';
import 'package:chef_portal/core/utils/snackbar_utils.dart';

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
    final shiftData = context.watch<ShiftBloc>().state.data;
    final shiftSummary = shiftData?.currentSession != null
        ? 'On shift ${ShiftUtils.formatSessionWindow(shiftData!.currentSession)}'
        : 'Ready to start shift';

    return BlocListener<ShiftBloc, ShiftState>(
      listener: (context, state) {
        if (state is ShiftError) {
          SnackBarUtils.showError(context, state.message);
        }
      },
      child: Scaffold(
        backgroundColor: NeutralColors.background,
        appBar: const ProfileAppBar(),
        body: ProfileDashboardView(staff: staff, shiftSummary: shiftSummary),
      ),
    );
  }
}

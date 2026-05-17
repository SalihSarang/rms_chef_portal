import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:chef_portal/features/profile/presentation/bloc/shift_bloc/shift_bloc.dart';
import 'package:chef_portal/features/profile/presentation/bloc/shift_bloc/shift_state.dart';
import 'package:chef_portal/features/profile/presentation/utils/profile_utils.dart';
import 'components/action_button.dart';

/// Section for managing shift lifecycle using a modular action-based UI.
///
/// This component aligns with the Cashier Portal's shift management system,
/// using declarative buttons for Start, Pause, Resume, and End actions.
class ProfileShiftSection extends StatelessWidget {
  final StaffModel staff;

  const ProfileShiftSection({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftBloc, ShiftState>(
      builder: (context, state) {
        final data = state.data;
        final isLoading = state is ShiftLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SHIFT CONTROLS',
              style: TextStyle(
                color: NeutralColors.icon,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                if (data?.canStart ?? true)
                  ActionButton(
                    label: 'Start Shift',
                    icon: Icons.play_arrow_rounded,
                    style: ActionButtonStyle.solidGreen,
                    isLoading: isLoading,
                    onPressed: () =>
                        ProfileUtils.handleStartShift(context, staff),
                  ),
                if (data?.canPause ?? false)
                  ActionButton(
                    label: 'Pause Shift',
                    icon: Icons.pause_rounded,
                    style: ActionButtonStyle.outlineWarning,
                    isLoading: isLoading,
                    onPressed: () =>
                        ProfileUtils.handlePauseShift(context, staff.id),
                  ),
                if (data?.canResume ?? false)
                  ActionButton(
                    label: 'Resume Shift',
                    icon: Icons.play_circle_outline_rounded,
                    style: ActionButtonStyle.outlineGreen,
                    isLoading: isLoading,
                    onPressed: () =>
                        ProfileUtils.handleResumeShift(context, staff.id),
                  ),
                if (data?.canEnd ?? false)
                  ActionButton(
                    label: 'End Shift',
                    icon: Icons.timer_off_rounded,
                    style: ActionButtonStyle.outlineRed,
                    isLoading: isLoading,
                    onPressed: () =>
                        ProfileUtils.handleEndShift(context, staff.id),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}

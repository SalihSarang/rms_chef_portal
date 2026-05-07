import 'package:chef_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_event.dart';
import 'package:chef_portal/features/profile/presentation/bloc/shift_bloc/shift_bloc.dart';
import 'package:chef_portal/features/profile/presentation/bloc/shift_bloc/shift_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:chef_portal/core/di/injector.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_state.dart';
import 'package:chef_portal/features/profile/presentation/bloc/shift_bloc/shift_state.dart';

/// Centralized utility for profile and shift-related actions.
class ProfileUtils {
  /// Handles starting a new shift.
  static void handleStartShift(BuildContext context, StaffModel staff) {
    context.read<ShiftBloc>().add(StartShiftEvent(staff));
  }

  /// Handles ending the current shift.
  static void handleEndShift(BuildContext context, String staffId) {
    context.read<ShiftBloc>().add(EndShiftEvent(staffId));
  }

  /// Handles pausing the active shift.
  static void handlePauseShift(BuildContext context, String staffId) {
    context.read<ShiftBloc>().add(PauseShiftEvent(staffId));
  }

  /// Handles resuming a paused shift.
  static void handleResumeShift(BuildContext context, String staffId) {
    context.read<ShiftBloc>().add(ResumeShiftEvent(staffId));
  }

  /// Handles the global logout flow with confirmation.
  static void handleLogout(BuildContext context) {
    RmsAlertDialog.show(
      context,
      title: 'Logout Confirmation',
      message: 'Are you sure you want to log out from the Staff Profile?',
      type: RmsAlertDialogType.confirm,
      confirmText: 'Logout',
      onConfirm: () async {
        final shiftBloc = context.read<ShiftBloc>();
        final authBloc = context.read<AuthBloc>();
        final shiftData = shiftBloc.state.data;

        if (shiftData != null && shiftData.canEnd) {
          final authState = authBloc.state;
          if (authState is Authenticated) {
            final staffId = authState.user.id;
            // End the shift and wait for it to complete
            await getIt<EndShift>().call(staffId);
            // Notify the bloc to update its state locally
            shiftBloc.add(EndShiftEvent(staffId));
          }
        }

        authBloc.add(SignOutEvent());
        if (context.mounted) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
      },
    );
  }

  /// Formats shift duration in minutes to a human-readable string.
  static String formatDuration(int minutes) {
    return ShiftUtils.formatMinutes(minutes);
  }

  /// Returns the design-system color for a given [ShiftStatus].
  static Color getShiftStatusColor(ShiftStatus? status) {
    switch (status) {
      case ShiftStatus.active:
        return StatusColors.ready;
      case ShiftStatus.paused:
        return StatusColors.pending;
      case ShiftStatus.ended:
        return StatusColors.preparing;
      default:
        return NeutralColors.icon;
    }
  }
}

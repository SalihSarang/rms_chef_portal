import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/app_colors/status_colors.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:chef_portal/features/profile/presentation/bloc/shift_bloc/shift_bloc.dart';
import 'package:chef_portal/features/profile/presentation/bloc/shift_bloc/shift_event.dart';
import 'package:chef_portal/features/profile/presentation/bloc/shift_bloc/shift_state.dart';

/// A dynamic, state-aware button for toggling the chef's shift.
///
/// It listens to the [ShiftBloc] and switches between "START SHIFT"
/// and "END SHIFT" labels and actions based on the current [ShiftState].
class ProfileShiftButton extends StatelessWidget {
  /// The unique identifier of the staff member managing their shift.
  final String staffId;

  const ProfileShiftButton({super.key, required this.staffId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftBloc, ShiftState>(
      builder: (context, state) {
        if (state is ShiftLoading) {
          return Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: NeutralColors.surface,
            ),
            child: const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: StatusColors.preparing,
                  strokeWidth: 2,
                ),
              ),
            ),
          );
        }

        final bool isActive = state is ShiftActive;

        return GestureDetector(
          onTap: () {
            if (isActive) {
              context.read<ShiftBloc>().add(EndShiftEvent(staffId));
            } else {
              context.read<ShiftBloc>().add(StartShiftEvent(staffId));
            }
          },
          child: Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color:
                    (isActive ? StatusColors.pending : StatusColors.preparing)
                        .withValues(alpha: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isActive ? Icons.stop_circle : Icons.play_circle_filled,
                  color: isActive
                      ? StatusColors.pending
                      : StatusColors.preparing,
                  size: 20,
                ),
                const SizedBox(width: 16),
                Text(
                  isActive ? "END SHIFT" : "START SHIFT",
                  style: TextStyle(
                    color: isActive
                        ? StatusColors.pending
                        : StatusColors.preparing,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

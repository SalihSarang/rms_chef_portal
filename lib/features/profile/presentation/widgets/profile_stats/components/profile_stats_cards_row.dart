import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:chef_portal/core/utils/kds_utils.dart';
import 'package:chef_portal/features/profile/presentation/bloc/shift_bloc/shift_state.dart';
import 'package:chef_portal/features/profile/presentation/utils/profile_utils.dart';
import 'profile_stats_card.dart';

class ProfileStatsCardsRow extends StatelessWidget {
  final StaffModel staff;
  final ShiftReady? shiftData;

  const ProfileStatsCardsRow({
    super.key,
    required this.staff,
    required this.shiftData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ProfileStatsCard(
            icon: Icons.access_time_rounded,
            label: 'SHIFT START',
            value:
                shiftData?.shiftStartLabel ??
                KdsUtils.formatTime(staff.lastActive),
            iconColor: PrimaryColors.defaultColor,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ProfileStatsCard(
            icon: Icons.timelapse_rounded,
            label: 'WORKED',
            value: shiftData?.workedLabel ?? '0h 0m',
            iconColor: PrimaryColors.defaultColor,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ProfileStatsCard(
            icon: Icons.pause_circle_outline_rounded,
            label: 'PAUSED',
            value: shiftData?.pauseLabel ?? '0h 0m',
            iconColor: SemanticColors.warning,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ProfileStatsCard(
            icon: Icons.track_changes_rounded,
            label: 'STATUS',
            value: shiftData?.statusLabel ?? 'Not Started',
            iconColor: ProfileUtils.getShiftStatusColor(shiftData?.status),
          ),
        ),
      ],
    );
  }
}

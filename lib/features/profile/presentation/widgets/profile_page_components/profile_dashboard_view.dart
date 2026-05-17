import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:chef_portal/core/widgets/custom_text.dart';
import '../profile_stats/profile_stats_section.dart';
import '../profile_details/profile_details_section.dart';
import '../profile_shift/profile_shift_section.dart';
import 'shift_history_section.dart';
import 'daily_earnings_section.dart';
import 'profile_sidebar_header.dart';

/// The main content view for the profile dashboard.
///
/// Wraps the header, shift management actions, history, and details
/// in a scrollable and constrained layout following the "Table of Contents" pattern.
class ProfileDashboardView extends StatelessWidget {
  final StaffModel staff;
  final String shiftSummary;

  const ProfileDashboardView({
    super.key,
    required this.staff,
    required this.shiftSummary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // LEFT SIDEBAR: Personal Details
        SizedBox(
          width: 300,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                ProfileSidebarHeader(staff: staff),
                const SizedBox(height: 32),
                const Divider(color: NeutralColors.border),
                const SizedBox(height: 32),
                ProfileDetailsSection(staff: staff),
              ],
            ),
          ),
        ),
        // VERTICAL DIVIDER
        const VerticalDivider(width: 1, color: NeutralColors.border),
        // MAIN CONTENT: Overview & Stats
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText.header('Overview', fontSize: 28),
                const SizedBox(height: 40),
                ProfileStatsSection(staff: staff),
                const SizedBox(height: 40),
                ProfileShiftSection(staff: staff),
                const SizedBox(height: 40),
                const ShiftHistorySection(),
                const SizedBox(height: 40),
                DailyEarningsSection(staff: staff),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:chef_portal/features/profile/presentation/bloc/shift_bloc/shift_bloc.dart';
import 'package:chef_portal/features/profile/presentation/bloc/shift_bloc/shift_state.dart';
import 'components/profile_stats_header.dart';
import 'components/profile_stats_cards_row.dart';

/// Section displaying a row of shift and performance statistics.
///
/// It uses a modular architecture with standalone header and card row components.
class ProfileStatsSection extends StatelessWidget {
  final StaffModel staff;

  const ProfileStatsSection({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileStatsHeader(),
        BlocBuilder<ShiftBloc, ShiftState>(
          builder: (context, shiftState) {
            return ProfileStatsCardsRow(
              staff: staff,
              shiftData: shiftState.data,
            );
          },
        ),
      ],
    );
  }
}

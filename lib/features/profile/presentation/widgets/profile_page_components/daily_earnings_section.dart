import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

import '../../bloc/shift_bloc/shift_bloc.dart';
import '../../bloc/shift_bloc/shift_state.dart';
import 'daily_earnings_components/daily_earnings_header.dart';
import 'daily_earnings_components/daily_earnings_row.dart';
import 'daily_earnings_components/daily_earnings_table_header.dart';

class DailyEarningsSection extends StatelessWidget {
  final StaffModel staff;

  const DailyEarningsSection({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    final history =
        context.watch<ShiftBloc>().state.data?.history ??
        const <ShiftSession>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DailyEarningsHeader(historyLength: history.length),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: NeutralColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: NeutralColors.border),
          ),
          child: Column(
            children: [
              const DailyEarningsTableHeader(),
              if (history.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'No earnings data available',
                    style: TextStyle(color: NeutralColors.icon),
                  ),
                )
              else
                ...history.take(3).map(
                  (session) => DailyEarningsRow(
                    session: session,
                    baseWage: staff.baseWage ?? 0.0,
                    wageType: staff.wageType ?? WageType.hourly,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

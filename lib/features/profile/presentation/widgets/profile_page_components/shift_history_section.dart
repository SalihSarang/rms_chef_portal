import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

import '../../bloc/shift_bloc/shift_bloc.dart';
import '../../bloc/shift_bloc/shift_state.dart';
import 'shift_history_components/shift_history_header.dart';
import 'shift_history_components/shift_history_row.dart';
import 'shift_history_components/shift_history_table_header.dart';

/// Section displaying a tabular history of recent shift sessions.
///
/// It uses a modular architecture with standalone header and row components
/// following the "Table of Contents" declarative pattern.
class ShiftHistorySection extends StatelessWidget {
  const ShiftHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final history =
        context.watch<ShiftBloc>().state.data?.history ??
        const <ShiftSession>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShiftHistoryHeader(historyLength: history.length),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: NeutralColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: NeutralColors.border),
          ),
          child: Column(
            children: [
              const ShiftHistoryTableHeader(),
              if (history.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'No recent shifts',
                    style: TextStyle(color: NeutralColors.icon),
                  ),
                )
              else
                ...history
                    .take(3)
                    .map((session) => ShiftHistoryRow(session: session)),
            ],
          ),
        ),
      ],
    );
  }
}

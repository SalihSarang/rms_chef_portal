import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../shift_history_components/table_header_text.dart';

class DailyEarningsTableHeader extends StatelessWidget {
  const DailyEarningsTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: NeutralColors.border.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: const Row(
        children: [
          Expanded(flex: 2, child: TableHeaderText('DATE')),
          Expanded(flex: 2, child: TableHeaderText('WORKED')),
          Expanded(flex: 2, child: TableHeaderText('RATE')),
          Expanded(
            flex: 2,
            child: TableHeaderText('TOTAL', align: TextAlign.end),
          ),
        ],
      ),
    );
  }
}

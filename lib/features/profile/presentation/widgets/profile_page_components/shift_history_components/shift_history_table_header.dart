import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'table_header_text.dart';

class ShiftHistoryTableHeader extends StatelessWidget {
  const ShiftHistoryTableHeader({super.key});

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
          Expanded(flex: 3, child: TableHeaderText('TIME')),
          Expanded(
            flex: 1,
            child: TableHeaderText('WORKED', align: TextAlign.end),
          ),
        ],
      ),
    );
  }
}

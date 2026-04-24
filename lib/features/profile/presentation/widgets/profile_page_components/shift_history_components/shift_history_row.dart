import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class ShiftHistoryRow extends StatelessWidget {
  final ShiftSession session;

  const ShiftHistoryRow({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: NeutralColors.border, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              ShiftUtils.dateKey(session.actualStart ?? DateTime.now()),
              style: const TextStyle(
                color: TextColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              '${ShiftUtils.formatTime(session.actualStart)} - ${ShiftUtils.formatTime(session.actualEnd)}',
              style: const TextStyle(color: TextColors.secondary, fontSize: 13),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              ShiftUtils.formatMinutes(session.workedMinutes),
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: StatusColors.ready,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'shift_history_header.dart';
import 'shift_history_empty.dart';
import 'shift_session_item.dart';

/// The container for the entire shift history list content.
class ShiftHistoryContent extends StatelessWidget {
  final List<ShiftSession> history;

  const ShiftHistoryContent({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShiftHistoryHeader(),
        if (history.isEmpty)
          const ShiftHistoryEmpty()
        else
          for (final session in history.take(5))
            ShiftSessionItem(session: session),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'shift_session_info.dart';

/// A single row item representing a shift session history record.
class ShiftSessionItem extends StatelessWidget {
  final ShiftSession session;

  const ShiftSessionItem({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          ShiftSessionInfo(session: session),
          Text(
            ShiftUtils.formatMinutes(session.workedMinutes),
            style: const TextStyle(
              color: TextColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

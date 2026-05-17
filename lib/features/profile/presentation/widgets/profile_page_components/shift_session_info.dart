import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

/// Displays the date and time window for a single shift session record.
class ShiftSessionInfo extends StatelessWidget {
  final ShiftSession session;

  const ShiftSessionInfo({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            session.dateKey,
            style: const TextStyle(
              color: TextColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            ShiftUtils.formatSessionWindow(session),
            style: const TextStyle(color: NeutralColors.icon),
          ),
        ],
      ),
    );
  }
}

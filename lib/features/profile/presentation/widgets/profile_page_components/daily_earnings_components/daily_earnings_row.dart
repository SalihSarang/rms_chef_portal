import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class DailyEarningsRow extends StatelessWidget {
  final ShiftSession session;
  final double baseWage;
  final WageType wageType;

  const DailyEarningsRow({
    super.key,
    required this.session,
    required this.baseWage,
    required this.wageType,
  });

  @override
  Widget build(BuildContext context) {
    final earnings = _calculateEarnings();
    final workedHours = session.workedMinutes / 60.0;

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
            flex: 2,
            child: Text(
              '${workedHours.toStringAsFixed(1)}h',
              style: const TextStyle(color: TextColors.secondary, fontSize: 13),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '₹${baseWage.toStringAsFixed(0)}/${wageType.name == "hourly" ? "hr" : "mo"}',
              style: const TextStyle(color: TextColors.secondary, fontSize: 13),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '₹${earnings.toStringAsFixed(2)}',
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

  double _calculateEarnings() {
    if (wageType == WageType.hourly) {
      return (session.workedMinutes / 60.0) * baseWage;
    } else {
      // Monthly: simple prorated per shift for display purposes (assuming 240 hours/month or similar)
      // Or just show N/A if it's fixed. Let's do a simple calculation for visibility.
      // Typically monthly earners don't have "daily earnings" the same way, but we can show value of work.
      return (session.workedMinutes / (30 * 8 * 60)) * baseWage; // Very rough monthly-to-minutes
    }
  }
}

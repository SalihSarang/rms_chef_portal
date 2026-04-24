import 'package:flutter/material.dart';
import 'package:chef_portal/core/utils/kds_utils.dart';
import 'header_status_indicator.dart';
import 'header_timer.dart';

/// Groups the status indicator badge and the elapsed time timer.
class HeaderStatusRow extends StatelessWidget {
  final String statusText;
  final DateTime createdAt;

  const HeaderStatusRow({
    super.key,
    required this.statusText,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeaderStatusIndicator(statusText: statusText),
        const SizedBox(width: 24),
        HeaderTimer(elapsedTime: KdsUtils.formatElapsedTime(createdAt)),
      ],
    );
  }
}

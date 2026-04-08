import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/app_colors/status_colors.dart';
import 'package:rms_shared_package/enums/enums.dart';

class KdsUtils {
  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  static Color getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return StatusColors.pending;
      case OrderStatus.preparing:
        return StatusColors.preparing;
      case OrderStatus.ready:
        return StatusColors.ready;
      case OrderStatus.completed:
        return NeutralColors.icon;
    }
  }

  static String getStatusText(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'PENDING';
      case OrderStatus.preparing:
        return 'PREP';
      case OrderStatus.ready:
        return 'READY';
      case OrderStatus.completed:
        return 'COMPLETED';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/status_colors.dart';
import 'package:rms_shared_package/enums/enums.dart';

class KdsUtils {
  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  static String formatTime(DateTime? dateTime) {
    if (dateTime == null) return "00 : 00";
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return "$hours : $minutes";
  }

  static Color getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return StatusColors.pending;
      case OrderStatus.preparing:
        return StatusColors.preparing;
      case OrderStatus.ready:
      case OrderStatus.served:
      case OrderStatus.completed:
        return StatusColors.ready;
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
      case OrderStatus.served:
        return 'SERVED';
      case OrderStatus.completed:
        return 'COMPLETED';
    }
  }

  static String formatElapsedTime(DateTime dateTime) {
    final difference = DateTime.now().difference(dateTime);
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m';
    } else {
      return '${difference.inHours}h ${difference.inMinutes.remainder(60)}m';
    }
  }

  static String getOrderButtonText(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'Start Order';
      case OrderStatus.preparing:
        return 'MARK READY';
      case OrderStatus.ready:
        return 'READY';
      case OrderStatus.served:
        return 'SERVED';
      case OrderStatus.completed:
        return 'COMPLETED';
    }
  }

  static IconData getOrderButtonIcon(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Icons.play_arrow;
      case OrderStatus.preparing:
        return Icons.check_circle_outline;
      case OrderStatus.ready:
      case OrderStatus.served:
      case OrderStatus.completed:
        return Icons.check;
    }
  }

  static OrderStatus? getNextOrderStatus(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return OrderStatus.preparing;
      case OrderStatus.preparing:
        return OrderStatus.ready;
      default:
        return null;
    }
  }
}

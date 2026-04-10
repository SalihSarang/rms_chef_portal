import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:chef_portal/core/utils/kds_utils.dart';
import 'package:rms_shared_package/enums/enums.dart';

/// A dynamic timer that displays the elapsed time for an order.
///
/// It stops updating and displays the final duration (Created to Updated)
/// when the order is marked as [OrderStatus.ready].
class KdsOrderTimer extends StatefulWidget {
  /// The time the order was first created.
  final DateTime createdAt;

  /// The time the order was last updated (used to calculate final duration).
  final DateTime updatedAt;

  /// The current state of the order, used to determine if the timer should run.
  final OrderStatus status;

  const KdsOrderTimer({
    super.key,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  @override
  State<KdsOrderTimer> createState() => _KdsOrderTimerState();
}

class _KdsOrderTimerState extends State<KdsOrderTimer> {
  Timer? _timer;
  late Duration _elapsed;

  bool get _isTimerStopped =>
      widget.status == OrderStatus.ready ||
      widget.status == OrderStatus.served ||
      widget.status == OrderStatus.completed;

  @override
  void initState() {
    super.initState();
    _calculateElapsed();
    if (!_isTimerStopped) {
      _startTimer();
    }
  }

  @override
  void didUpdateWidget(KdsOrderTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_isTimerStopped) {
      _timer?.cancel();
    } else if (_timer == null || !_timer!.isActive) {
      _startTimer();
    }
    _calculateElapsed();
  }

  void _calculateElapsed() {
    if (_isTimerStopped) {
      _elapsed = widget.updatedAt.difference(widget.createdAt);
    } else {
      _elapsed = DateTime.now().difference(widget.createdAt);
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _elapsed = DateTime.now().difference(widget.createdAt);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      KdsUtils.formatDuration(_elapsed),
      style: const TextStyle(
        color: NeutralColors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

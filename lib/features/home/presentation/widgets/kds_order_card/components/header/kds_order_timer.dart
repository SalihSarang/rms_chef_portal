import 'dart:async';
import 'package:flutter/material.dart';
import 'package:chef_portal/core/utils/kds_utils.dart';
import 'package:rms_shared_package/enums/enums.dart';

/// A dynamic timer that displays the elapsed time for an order in a digital style.
///
/// It shows a "TIME" label above when active, and "PREP TIME" label when the order
/// is complete. The timer text is colored to match the current order status color.
/// It stops updating when the order is [OrderStatus.ready] or beyond.
class KdsOrderTimer extends StatefulWidget {
  /// The time the order was first created.
  final DateTime createdAt;

  /// The time the order was last updated (used to calculate final duration).
  final DateTime updatedAt;

  /// The current state of the order, used to determine if the timer should run.
  final OrderStatus status;

  /// The status color used to style the timer text.
  final Color statusColor;

  const KdsOrderTimer({
    super.key,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.statusColor,
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
    final label = _isTimerStopped ? 'PREP TIME' : 'TIME';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            color: widget.statusColor.withValues(alpha: 0.7),
            fontSize: 9,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          KdsUtils.formatDuration(_elapsed),
          style: TextStyle(
            color: widget.statusColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}

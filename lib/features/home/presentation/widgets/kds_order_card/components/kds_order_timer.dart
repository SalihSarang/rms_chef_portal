import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:chef_portal/core/utils/kds_utils.dart';

class KdsOrderTimer extends StatefulWidget {
  final DateTime createdAt;

  const KdsOrderTimer({super.key, required this.createdAt});

  @override
  State<KdsOrderTimer> createState() => _KdsOrderTimerState();
}

class _KdsOrderTimerState extends State<KdsOrderTimer> {
  late Timer _timer;
  late Duration _elapsed;

  @override
  void initState() {
    super.initState();
    _elapsed = DateTime.now().difference(widget.createdAt);
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
    _timer.cancel();
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

import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/widgets/rms_button.dart';
import 'package:rms_shared_package/enums/enums.dart';

class KdsOrderCardAction extends StatelessWidget {
  final OrderStatus orderStatus;
  final Color statusColor;
  final Function(OrderStatus) onStatusChange;

  const KdsOrderCardAction({
    super.key,
    required this.orderStatus,
    required this.statusColor,
    required this.onStatusChange,
  });

  String _getButtonText() {
    switch (orderStatus) {
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

  IconData _getButtonIcon() {
    switch (orderStatus) {
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

  OrderStatus? _getNextStatus() {
    switch (orderStatus) {
      case OrderStatus.pending:
        return OrderStatus.preparing;
      case OrderStatus.preparing:
        return OrderStatus.ready;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final nextStatus = _getNextStatus();

    return Padding(
      padding: const EdgeInsets.all(16.0),

      child: RmsButton(
        height: 44,
        text: _getButtonText(),
        borderColor: statusColor,
        icon: Icon(_getButtonIcon(), color: NeutralColors.white),
        onPressed: nextStatus != null ? () => onStatusChange(nextStatus) : null,
      ),
    );
  }
}

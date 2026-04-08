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
        return 'Complete';
      case OrderStatus.completed:
        return 'Done';
    }
  }

  IconData _getButtonIcon() {
    switch (orderStatus) {
      case OrderStatus.pending:
        return Icons.play_arrow;
      case OrderStatus.preparing:
        return Icons.check_circle_outline;
      case OrderStatus.ready:
        return Icons.check;
      default:
        return Icons.check;
    }
  }

  OrderStatus? _getNextStatus() {
    switch (orderStatus) {
      case OrderStatus.pending:
        return OrderStatus.preparing;
      case OrderStatus.preparing:
        return OrderStatus.ready;
      case OrderStatus.ready:
        return OrderStatus.completed;
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
        text: _getButtonText(),
        borderColor: statusColor,
        icon: Icon(_getButtonIcon(), color: NeutralColors.white),
        onPressed: nextStatus != null ? () => onStatusChange(nextStatus) : null,
      ),
    );
  }
}

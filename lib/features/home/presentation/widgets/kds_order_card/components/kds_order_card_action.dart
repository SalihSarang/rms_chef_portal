import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/enums/enums.dart';
import 'package:chef_portal/core/utils/kds_utils.dart';

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

  @override
  Widget build(BuildContext context) {
    final nextStatus = KdsUtils.getNextOrderStatus(orderStatus);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RmsButton(
        height: 44,
        text: KdsUtils.getOrderButtonText(orderStatus),
        borderColor: statusColor,
        icon: Icon(
          KdsUtils.getOrderButtonIcon(orderStatus),
          color: TextColors.primary,
        ),
        onPressed: nextStatus != null ? () => onStatusChange(nextStatus) : null,
      ),
    );
  }
}

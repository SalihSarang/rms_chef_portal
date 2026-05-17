import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/enums/enums.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'package:chef_portal/core/utils/kds_utils.dart';

class KdsOrderCardAction extends StatelessWidget {
  final OrderModel order;
  final Color statusColor;
  final Function(OrderStatus) onStatusChange;

  const KdsOrderCardAction({
    super.key,
    required this.order,
    required this.statusColor,
    required this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    final nextStatus = KdsUtils.getNextOrderStatus(order.orderStatus);
    final isEnabled = nextStatus != null;
    final buttonText = KdsUtils.getOrderButtonText(order.orderStatus);
    final buttonIcon = KdsUtils.getOrderButtonIcon(order.orderStatus);
    // Capture as non-nullable for the closure
    final safeNextStatus = nextStatus;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: GestureDetector(
        onTap: isEnabled && safeNextStatus != null
            ? () => onStatusChange(safeNextStatus)
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: isEnabled
                ? LinearGradient(
                    colors: [statusColor, statusColor.withValues(alpha: 0.75)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
                : null,
            color: isEnabled ? null : NeutralColors.border,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isEnabled
                ? [
                    BoxShadow(
                      color: statusColor.withValues(alpha: 0.4),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                buttonIcon,
                color: isEnabled ? TextColors.primary : NeutralColors.icon,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                buttonText,
                style: TextStyle(
                  color: isEnabled ? TextColors.primary : NeutralColors.icon,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

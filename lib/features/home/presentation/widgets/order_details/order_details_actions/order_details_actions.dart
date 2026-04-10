import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'components/status_action_button.dart';

/// The [OrderDetailsActions] widget provides the primary interaction area 
/// for chefs to manage the lifecycle of an order.
/// 
/// It dynamically renders action buttons based on the current [OrderStatus].
class OrderDetailsActions extends StatelessWidget {
  /// The order being managed.
  final OrderModel order;

  /// Callback to notify the parent of a status transition.
  final Function(OrderStatus) onStatusChange;

  const OrderDetailsActions({
    super.key,
    required this.order,
    required this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    // If the order is already ready, served, or completed, no actions are available to the chef.
    if (order.orderStatus == OrderStatus.ready ||
        order.orderStatus == OrderStatus.served ||
        order.orderStatus == OrderStatus.completed) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [_buildActionButton(context)],
    );
  }

  /// Determines which action button to show based on the order's current status.
  Widget _buildActionButton(BuildContext context) {
    switch (order.orderStatus) {
      case OrderStatus.pending:
        // Transition from Pending to Preparing
        return StatusActionButton(
          label: 'START PREPARING',
          dialogTitle: 'Start Preparing',
          dialogMessage: 'Are you sure you want to start preparing this order?',
          targetStatus: OrderStatus.preparing,
          dialogType: RmsAlertDialogType.info,
          onConfirm: onStatusChange,
        );

      case OrderStatus.preparing:
        // Transition from Preparing to Ready
        return StatusActionButton(
          label: 'MARK AS READY',
          dialogTitle: 'Order Ready',
          dialogMessage: 'Has this order been fully prepared and is it ready for pickup?',
          targetStatus: OrderStatus.ready,
          dialogType: RmsAlertDialogType.success,
          borderColor: StatusColors.ready,
          onConfirm: onStatusChange,
        );

      default:
        // No action for other statuses in this view.
        return const SizedBox.shrink();
    }
  }
}

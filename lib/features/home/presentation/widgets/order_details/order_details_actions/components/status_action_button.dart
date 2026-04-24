import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

/// A reusable action button component for order status transitions.
///
/// This component encapsulates the styling (using [RmsButton]) and the
/// confirmation logic (using [RmsAlertDialog]) for moving an order
/// from one status to another.
class StatusActionButton extends StatelessWidget {
  /// The label to display on the button.
  final String label;

  /// The title of the confirmation dialog.
  final String dialogTitle;

  /// The body message of the confirmation dialog.
  final String dialogMessage;

  /// The target status to transition the order to.
  final OrderStatus targetStatus;

  /// The type of dialog to show (e.g., info, success, warning).
  final RmsAlertDialogType dialogType;

  /// The border color for the button (optional).
  final Color? borderColor;

  /// Callback when the status transition is confirmed.
  final Function(OrderStatus) onConfirm;

  const StatusActionButton({
    super.key,
    required this.label,
    required this.dialogTitle,
    required this.dialogMessage,
    required this.targetStatus,
    required this.dialogType,
    this.borderColor,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final isPrimary =
        targetStatus == OrderStatus.preparing ||
        targetStatus == OrderStatus.ready;

    return Container(
      decoration: isPrimary
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: PrimaryColors.defaultColor.withValues(alpha: 0.4),
                  blurRadius: 20,
                  spreadRadius: -5,
                  offset: const Offset(0, 10),
                ),
              ],
            )
          : null,
      child: RmsButton(
        text: label.toUpperCase(),
        borderColor:
            borderColor ?? (isPrimary ? PrimaryColors.defaultColor : null),
        icon: isPrimary ? const Icon(Icons.play_circle_filled, size: 20) : null,
        height: 56,
        onPressed: () => _showConfirmation(context),
      ),
    );
  }

  /// Displays a confirmation dialog before proceeding with the status change.
  void _showConfirmation(BuildContext context) {
    RmsAlertDialog.show(
      context,
      title: dialogTitle,
      message: dialogMessage,
      type: dialogType,
      confirmText: 'Yes, Proceed',
      onConfirm: () => onConfirm(targetStatus),
    );
  }
}

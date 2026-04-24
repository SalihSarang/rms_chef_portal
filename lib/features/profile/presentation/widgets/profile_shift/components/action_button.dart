import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Visual style variants for [ActionButton].
enum ActionButtonStyle {
  solidGreen,
  solidWarning,
  outlineGreen,
  outlineWarning,
  outlineRed,
}

/// A compact labelled icon button used in the profile shift controls panel.
class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final ActionButtonStyle style;
  final VoidCallback? onPressed;
  final bool isLoading;

  const ActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.style,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color fg;
    final Color? bg;
    final Color border;

    switch (style) {
      case ActionButtonStyle.solidGreen:
        fg = Colors.black;
        bg = StatusColors.ready;
        border = StatusColors.ready;
        break;
      case ActionButtonStyle.solidWarning:
        fg = Colors.black;
        bg = StatusColors.pending;
        border = StatusColors.pending;
        break;
      case ActionButtonStyle.outlineGreen:
        fg = StatusColors.ready;
        bg = StatusColors.ready.withValues(alpha: 0.1);
        border = StatusColors.ready;
        break;
      case ActionButtonStyle.outlineWarning:
        fg = StatusColors.pending;
        bg = StatusColors.pending.withValues(alpha: 0.1);
        border = StatusColors.pending;
        break;
      case ActionButtonStyle.outlineRed:
        fg = SemanticColors.error;
        bg = SemanticColors.error.withValues(alpha: 0.1);
        border = SemanticColors.error;
        break;
    }

    return InkWell(
      onTap: isLoading ? null : onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: border, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLoading)
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2, color: fg),
              )
            else ...[
              Icon(icon, size: 18, color: fg),
              const SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(
                  color: fg,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

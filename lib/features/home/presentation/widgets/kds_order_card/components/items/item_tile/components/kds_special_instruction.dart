import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Displays special instructions for an item in amber italic with a note prefix.
class SpecialInstruction extends StatelessWidget {
  final String instructions;
  const SpecialInstruction({super.key, required this.instructions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 42, top: 2),
      child: Text(
        '⚑  $instructions',
        style: const TextStyle(
          color: StatusColors.pending,
          fontSize: 11,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

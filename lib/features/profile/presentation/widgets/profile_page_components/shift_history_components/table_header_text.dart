import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class TableHeaderText extends StatelessWidget {
  final String text;
  final TextAlign align;

  const TableHeaderText(this.text, {super.key, this.align = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: const TextStyle(
        color: NeutralColors.icon,
        fontSize: 10,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
    );
  }
}

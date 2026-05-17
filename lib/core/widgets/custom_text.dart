import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A wrapper around [Text] that enforces the RMS Design System defaults.
/// Unlike the standard [Text] widget, [CustomText] provides centralized
/// styling and semantic presets (like .header or .secondary).
class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? letterSpacing;

  /// Default constructor with RMS standard body styling.
  const CustomText(
    this.text, {
    super.key,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    this.color = TextColors.primary,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration,
    this.decorationColor,
    this.letterSpacing,
  });

  /// Large, bold text for headings.
  const CustomText.header(
    this.text, {
    super.key,
    this.fontSize = 24.0,
    this.fontWeight = FontWeight.bold,
    this.color = TextColors.primary,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration,
    this.decorationColor,
    this.letterSpacing,
  });

  /// Standard size text with secondary color for hints or subtitles.
  const CustomText.secondary(
    this.text, {
    super.key,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    this.color = TextColors.secondary,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration,
    this.decorationColor,
    this.letterSpacing,
  });

  /// Smaller text for captions or labels.
  const CustomText.small(
    this.text, {
    super.key,
    this.fontSize = 12.0,
    this.fontWeight = FontWeight.normal,
    this.color = NeutralColors.icon,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.decoration,
    this.decorationColor,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// Displays the current status of an order in the header.
class HeaderStatusIndicator extends StatelessWidget {
  /// The human-readable status text.
  final String statusText;

  const HeaderStatusIndicator({super.key, required this.statusText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'Status',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        Text(
          statusText.toUpperCase(),
          style: const TextStyle(
            color: Colors.amber,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

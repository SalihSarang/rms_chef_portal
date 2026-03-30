import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';

class HomeWelcomeSection extends StatelessWidget {
  final String userName;

  const HomeWelcomeSection({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome, Chef $userName!',
            style: const TextStyle(
              color: NeutralColors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Manage your kitchen and orders here.',
            style: TextStyle(color: NeutralColors.icon, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

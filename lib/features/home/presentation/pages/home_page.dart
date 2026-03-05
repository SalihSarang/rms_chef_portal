import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_event.dart';
import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import 'package:chef_portal/features/home/presentation/widgets/home_welcome_section.dart';
import 'package:chef_portal/features/home/presentation/widgets/shift_toggle_button.dart';

class HomePage extends StatelessWidget {
  final StaffModel staff;

  const HomePage({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: AppBar(
        title: const Text(
          'Chef Dashboard',
          style: TextStyle(color: NeutralColors.white),
        ),
        backgroundColor: NeutralColors.glassBackground,
        actions: [
          ShiftToggleButton(staffId: staff.id),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.grey),
            tooltip: 'Logout',
            onPressed: () => context.read<AuthBloc>().add(SignOutEvent()),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: HomeWelcomeSection(userName: staff.name),
    );
  }
}

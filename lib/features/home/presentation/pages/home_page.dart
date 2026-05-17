import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_bloc.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_state.dart';
import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import '../widgets/home_view/home_view.dart';

/// The main landing page for the Kitchen Display System (KDS).
///
/// This page displays a grid of incoming or completed orders and provides
/// access to the user profile and shift management.
class HomePage extends StatelessWidget {
  /// The current logged-in staff member.
  final StaffModel staff;

  const HomePage({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KdsBloc, KdsState>(
      builder: (context, state) => HomeView(state: state, staff: staff),
    );
  }
}

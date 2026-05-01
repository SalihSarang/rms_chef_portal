import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_state.dart';
import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import 'package:chef_portal/features/profile/presentation/bloc/shift_bloc/shift_bloc.dart';
import 'package:chef_portal/features/profile/presentation/page/profile_page.dart';
import 'kds_app_bar.dart';

/// A wrapper for [KdsAppBar] that includes the navigation logic
/// to the [ProfilePage].
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final KdsState state;
  final StaffModel staff;

  const HomeAppBar({super.key, required this.state, required this.staff});

  @override
  Widget build(BuildContext context) {
    return KdsAppBar(
      state: state,
      onProfileTap: () {
        final shiftBloc = context.read<ShiftBloc>();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: shiftBloc,
              child: ProfilePage(staff: staff),
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_bloc.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_state.dart';
import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import 'package:rms_shared_package/enums/enums.dart';

import '../widgets/home_page_components/kds_app_bar.dart';
import '../widgets/home_page_components/kds_empty_state.dart';
import '../widgets/home_page_components/kds_order_grid.dart';
import 'package:chef_portal/features/profile/presentation/bloc/shift_bloc/shift_bloc.dart';
import 'package:chef_portal/features/profile/presentation/page/profile_page.dart';

class HomePage extends StatelessWidget {
  final StaffModel staff;

  const HomePage({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KdsBloc, KdsState>(
      builder: (context, state) {
        final filteredOrders = state.orders.where((order) {
          if (state.showCompleted) {
            return order.orderStatus == OrderStatus.completed;
          } else {
            return order.orderStatus != OrderStatus.completed;
          }
        }).toList();

        return Scaffold(
          backgroundColor: NeutralColors.background,
          appBar: KdsAppBar(
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
          ),
          body: filteredOrders.isEmpty
              ? KdsEmptyState(showCompleted: state.showCompleted)
              : KdsOrderGrid(orders: filteredOrders),
        );
      },
    );
  }
}

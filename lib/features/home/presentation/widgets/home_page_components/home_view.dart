import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_state.dart';
import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import 'package:rms_shared_package/enums/enums.dart';

import 'home_app_bar.dart';
import 'kds_empty_state.dart';
import 'kds_order_grid.dart';

/// The main content view for the KDS Home screen.
///
/// Handles filtering orders based on the [KdsState.showCompleted] flag
/// and displays either the [KdsOrderGrid] or a [KdsEmptyState].
class HomeView extends StatelessWidget {
  final KdsState state;
  final StaffModel staff;

  const HomeView({super.key, required this.state, required this.staff});

  @override
  Widget build(BuildContext context) {
    final filteredOrders = state.orders.where((order) {
      if (state.showCompleted) {
        return order.orderStatus == OrderStatus.ready ||
            order.orderStatus == OrderStatus.served ||
            order.orderStatus == OrderStatus.completed;
      } else {
        return order.orderStatus == OrderStatus.pending ||
            order.orderStatus == OrderStatus.preparing;
      }
    }).toList();

    return Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: HomeAppBar(state: state, staff: staff),
      body: filteredOrders.isEmpty
          ? KdsEmptyState(showCompleted: state.showCompleted)
          : KdsOrderGrid(orders: filteredOrders),
    );
  }
}

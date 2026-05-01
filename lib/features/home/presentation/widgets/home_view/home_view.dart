import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_state.dart';
import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import 'package:rms_shared_package/enums/enums.dart';

import 'components/home_app_bar/home_app_bar.dart';
import 'components/kds_empty_state.dart';
import '../kds_order_grid/kds_order_grid.dart';
import '../kds_consolidated_view/kds_consolidated_view.dart';

/// The main content view for the KDS Home screen.
///
/// Handles filtering orders based on the [KdsState.showCompleted] flag
/// and displays either the [KdsOrderGrid], [KdsConsolidatedItemView], or a [KdsEmptyState].
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

    Widget content;
    if (filteredOrders.isEmpty) {
      content = KdsEmptyState(showCompleted: state.showCompleted);
    } else if (state.viewMode == KdsViewMode.consolidated) {
      content = KdsConsolidatedItemView(orders: filteredOrders);
    } else {
      content = KdsOrderGrid(orders: filteredOrders);
    }

    return Scaffold(
      backgroundColor: NeutralColors.background,
      appBar: HomeAppBar(state: state, staff: staff),
      body: content,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_shared_package/enums/enums.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/kds_bloc/kds_bloc.dart';
import '../bloc/kds_bloc/kds_event.dart';
import '../bloc/kds_bloc/kds_state.dart';
import '../widgets/order_details/order_details_header/order_details_header.dart';
import '../widgets/order_details/order_details_items.dart';
import '../widgets/order_details/order_details_sidebar/order_details_sidebar.dart';

/// A page that displays detailed information about a specific order for the KDS.
class OrderDetailsPage extends StatelessWidget {
  final OrderModel order;
  final Function(String, OrderStatus) onStatusChange;

  const OrderDetailsPage({
    super.key,
    required this.order,
    required this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KdsBloc, KdsState>(
      builder: (context, state) {
        // Find the most recent version of this order from the state
        final currentOrder = state.orders.firstWhere(
          (o) => o.id == order.id,
          orElse: () => order,
        );

        return Scaffold(
          key: ValueKey('order_details_${currentOrder.id}'),
          backgroundColor: NeutralColors.background,
          body: Row(
            children: [
              // Main Content Area (Left)
              Expanded(
                child: Column(
                  children: [
                    OrderDetailsHeader(order: currentOrder),
                    Expanded(
                      child: OrderDetailsItems(
                        items: currentOrder.orderedMenu,
                        enabled:
                            currentOrder.orderStatus != OrderStatus.ready &&
                            currentOrder.orderStatus != OrderStatus.served &&
                            currentOrder.orderStatus != OrderStatus.completed,
                        onToggle: (index, isPrepared) {
                          if (!context.mounted) return;

                          // Final safety check to ensure no updates happen for completed orders
                          final isReadOnly =
                              currentOrder.orderStatus == OrderStatus.ready ||
                              currentOrder.orderStatus == OrderStatus.served ||
                              currentOrder.orderStatus == OrderStatus.completed;

                          if (isReadOnly) return;

                          context.read<KdsBloc>().add(
                            ToggleKdsItemPreparedEvent(
                              orderId: currentOrder.id,
                              itemIndex: index,
                              isPrepared: isPrepared,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Sidebar Area (Right)
              OrderDetailsSidebar(
                order: currentOrder,
                onStatusChange: (status) =>
                    onStatusChange(currentOrder.id, status),
              ),
            ],
          ),
        );
      },
    );
  }
}

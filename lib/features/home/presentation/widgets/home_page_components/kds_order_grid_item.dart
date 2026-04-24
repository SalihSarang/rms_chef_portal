import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_bloc.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_event.dart';
import 'package:chef_portal/features/home/presentation/widgets/kds_order_card/kds_order_card.dart';
import 'package:chef_portal/features/home/presentation/pages/order_details_page.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'package:rms_shared_package/enums/enums.dart';

/// A wrapper for [KdsOrderCard] that handles status updates
/// and navigation to the [OrderDetailsPage].
class KdsOrderGridItem extends StatelessWidget {
  final OrderModel order;

  const KdsOrderGridItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return KdsOrderCard(
      order: order,
      onStatusChange: (status) {
        context.read<KdsBloc>().add(
          UpdateKdsOrderStatusEvent(orderId: order.id, status: status),
        );
      },
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (modalContext) => OrderDetailsPage(
              order: order,
              onStatusChange: (orderId, OrderStatus status) {
                context.read<KdsBloc>().add(
                  UpdateKdsOrderStatusEvent(orderId: orderId, status: status),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_bloc.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_event.dart';
import 'package:chef_portal/features/home/presentation/widgets/kds_order_card/kds_order_card.dart';
import 'package:chef_portal/features/home/presentation/pages/order_details_page.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'package:rms_shared_package/enums/enums.dart';
import 'package:rms_design_system/rms_design_system.dart';

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
        String title = '';
        String message = '';
        RmsAlertDialogType type = RmsAlertDialogType.info;

        if (status == OrderStatus.preparing) {
          title = 'Start Preparing';
          message = 'Are you sure you want to start preparing this order?';
          type = RmsAlertDialogType.info;
        } else if (status == OrderStatus.ready) {
          title = 'Order Ready';
          message =
              'Has this order been fully prepared and is it ready for pickup?';
          type = RmsAlertDialogType.success;
        }

        if (title.isNotEmpty) {
          RmsAlertDialog.show(
            context,
            title: title,
            message: message,
            type: type,
            confirmText: 'Yes, Proceed',
            onConfirm: () {
              context.read<KdsBloc>().add(
                UpdateKdsOrderStatusEvent(orderId: order.id, status: status),
              );
            },
          );
        } else {
          context.read<KdsBloc>().add(
            UpdateKdsOrderStatusEvent(orderId: order.id, status: status),
          );
        }
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_bloc.dart';
import 'package:chef_portal/features/home/presentation/bloc/kds_bloc/kds_event.dart';
import 'package:chef_portal/features/home/presentation/widgets/kds_order_card/kds_order_card.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';

class KdsOrderGrid extends StatelessWidget {
  final List<OrderModel> orders;

  const KdsOrderGrid({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine cross axis count based on width
        int crossAxisCount = 3;
        if (constraints.maxWidth < 800) {
          crossAxisCount = 1;
        } else if (constraints.maxWidth < 1200) {
          crossAxisCount = 2;
        }

        return GridView.builder(
          padding: const EdgeInsets.all(24),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 1.1, // Adjust based on content height
          ),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return KdsOrderCard(
              order: order,
              onStatusChange: (status) {
                context.read<KdsBloc>().add(
                  UpdateKdsOrderStatusEvent(orderId: order.id, status: status),
                );
              },
            );
          },
        );
      },
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/enums/enums.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';

abstract class KdsEvent extends Equatable {
  const KdsEvent();

  @override
  List<Object> get props => [];
}

class FetchKdsOrdersEvent extends KdsEvent {}

class OrdersUpdatedInternal extends KdsEvent {
  final List<OrderModel> orders;
  const OrdersUpdatedInternal(this.orders);
  @override
  List<Object> get props => [orders];
}

class UpdateKdsOrderStatusEvent extends KdsEvent {
  final String orderId;
  final OrderStatus status;

  const UpdateKdsOrderStatusEvent({
    required this.orderId,
    required this.status,
  });

  @override
  List<Object> get props => [orderId, status];
}

class ToggleKdsTabEvent extends KdsEvent {
  final bool showCompleted;

  const ToggleKdsTabEvent({required this.showCompleted});

  @override
  List<Object> get props => [showCompleted];
}

class ToggleKdsItemPreparedEvent extends KdsEvent {
  final String orderId;
  final int itemIndex;
  final bool isPrepared;

  const ToggleKdsItemPreparedEvent({
    required this.orderId,
    required this.itemIndex,
    required this.isPrepared,
  });

  @override
  List<Object> get props => [orderId, itemIndex, isPrepared];
}

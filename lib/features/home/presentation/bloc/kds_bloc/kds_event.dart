import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/enums/enums.dart';

abstract class KdsEvent extends Equatable {
  const KdsEvent();

  @override
  List<Object> get props => [];
}

class FetchKdsOrdersEvent extends KdsEvent {}

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

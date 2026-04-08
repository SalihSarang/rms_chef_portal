import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';

enum KdsStatus { initial, loading, loaded, error }

class KdsState extends Equatable {
  final KdsStatus status;
  final List<OrderModel> orders;
  final bool showCompleted;
  final String? errorMessage;

  const KdsState({
    this.status = KdsStatus.initial,
    this.orders = const [],
    this.showCompleted = false,
    this.errorMessage,
  });

  KdsState copyWith({
    KdsStatus? status,
    List<OrderModel>? orders,
    bool? showCompleted,
    String? errorMessage,
  }) {
    return KdsState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      showCompleted: showCompleted ?? this.showCompleted,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, orders, showCompleted, errorMessage];
}

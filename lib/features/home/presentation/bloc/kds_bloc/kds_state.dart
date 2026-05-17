import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';

enum KdsStatus { initial, loading, loaded, error }

enum KdsViewMode { grid, consolidated }

class KdsState extends Equatable {
  final KdsStatus status;
  final List<OrderModel> orders;
  final bool showCompleted;
  final KdsViewMode viewMode;
  final String? errorMessage;

  const KdsState({
    this.status = KdsStatus.initial,
    this.orders = const [],
    this.showCompleted = false,
    this.viewMode = KdsViewMode.grid,
    this.errorMessage,
  });

  KdsState copyWith({
    KdsStatus? status,
    List<OrderModel>? orders,
    bool? showCompleted,
    KdsViewMode? viewMode,
    String? errorMessage,
  }) {
    return KdsState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      showCompleted: showCompleted ?? this.showCompleted,
      viewMode: viewMode ?? this.viewMode,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, orders, showCompleted, viewMode, errorMessage];
}

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_portal/features/home/domain/repositories/home_repository.dart';
import 'kds_event.dart';
import 'kds_state.dart';

class KdsBloc extends Bloc<KdsEvent, KdsState> {
  final HomeRepository homeRepository;
  StreamSubscription? _ordersSubscription;

  KdsBloc({required this.homeRepository}) : super(const KdsState()) {
    on<FetchKdsOrdersEvent>(_onFetchOrders);
    on<UpdateKdsOrderStatusEvent>(_onUpdateOrderStatus);
    on<ToggleKdsTabEvent>(_onToggleTab);
    on<ToggleKdsViewModeEvent>(_onToggleViewMode);
    on<ToggleKdsItemPreparedEvent>(_onToggleItemPrepared);
    on<OrdersUpdatedInternal>(_onOrdersUpdated);
  }

  Future<void> _onFetchOrders(
    FetchKdsOrdersEvent event,
    Emitter<KdsState> emit,
  ) async {
    emit(state.copyWith(status: KdsStatus.loading));
    await _ordersSubscription?.cancel();

    _ordersSubscription = homeRepository.getOrders().listen((orders) {
      add(OrdersUpdatedInternal(orders));
    });
  }

  void _onOrdersUpdated(OrdersUpdatedInternal event, Emitter<KdsState> emit) {
    emit(state.copyWith(status: KdsStatus.loaded, orders: event.orders));
  }

  Future<void> _onUpdateOrderStatus(
    UpdateKdsOrderStatusEvent event,
    Emitter<KdsState> emit,
  ) async {
    try {
      await homeRepository.updateOrderStatus(event.orderId, event.status);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _onToggleItemPrepared(
    ToggleKdsItemPreparedEvent event,
    Emitter<KdsState> emit,
  ) async {
    try {
      await homeRepository.updateItemPreparationStatus(
        event.orderId,
        event.itemIndex,
        event.isPrepared,
      );
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void _onToggleTab(ToggleKdsTabEvent event, Emitter<KdsState> emit) {
    emit(state.copyWith(showCompleted: event.showCompleted));
  }

  void _onToggleViewMode(ToggleKdsViewModeEvent event, Emitter<KdsState> emit) {
    emit(state.copyWith(viewMode: event.viewMode));
  }

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    return super.close();
  }
}

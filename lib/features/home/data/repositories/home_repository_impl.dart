import 'package:chef_portal/features/home/data/datasources/home_remote_datasource.dart';
import 'package:chef_portal/features/home/domain/repositories/home_repository.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'package:rms_shared_package/enums/enums.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<List<OrderModel>> getOrders() {
    return remoteDataSource.getOrders();
  }

  @override
  Future<void> updateOrderStatus(String orderId, OrderStatus status) async {
    return remoteDataSource.updateOrderStatus(orderId, status);
  }

  @override
  Future<void> updateItemPreparationStatus(
    String orderId,
    int itemIndex,
    bool isPrepared,
  ) async {
    return remoteDataSource.updateItemPreparationStatus(
      orderId,
      itemIndex,
      isPrepared,
    );
  }
}

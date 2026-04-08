import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'package:rms_shared_package/enums/enums.dart';

abstract class HomeRepository {
  Stream<List<OrderModel>> getOrders();
  Future<void> updateOrderStatus(String orderId, OrderStatus status);
}

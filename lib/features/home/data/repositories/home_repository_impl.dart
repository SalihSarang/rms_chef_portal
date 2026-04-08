import 'package:chef_portal/features/home/data/datasources/home_remote_datasource.dart';
import 'package:chef_portal/features/home/domain/repositories/home_repository.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'package:rms_shared_package/enums/enums.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<List<OrderModel>> getOrders() {
    // Return a mock stream for UI development
    return Stream.value([
      OrderModel(
        id: '203',
        tableNumber: '4',
        staffId: 'staff1',
        orderedMenu: [
          CartItemModel(
            foodId: '1',
            name: 'Caesar Salad',
            imageUrl: '',
            quantity: 2,
            price: 15.0,
            selectedAddOns: [],
            specialInstructions: 'Dressing on side',
          ),
          CartItemModel(
            foodId: '2',
            name: 'Garlic Bread',
            imageUrl: '',
            quantity: 1,
            price: 5.0,
            selectedAddOns: [],
          ),
          CartItemModel(
            foodId: '3',
            name: 'Coke Zero',
            imageUrl: '',
            quantity: 1,
            price: 2.5,
            selectedAddOns: [],
          ),
        ],
        paymentStatus: PaymentStatus.pending,
        orderStatus: OrderStatus.pending,
        totalAmount: 37.5,
        seatCount: 2,
        createdAt: DateTime.now().subtract(
          const Duration(minutes: 1, seconds: 20),
        ),
        updatedAt: DateTime.now(),
      ),
      OrderModel(
        id: '201',
        tableNumber: '12',
        staffId: 'staff1',
        orderedMenu: [
          CartItemModel(
            foodId: '4',
            name: 'Onion Rings',
            imageUrl: '',
            quantity: 1,
            price: 6.0,
            selectedAddOns: [],
          ),
          CartItemModel(
            foodId: '5',
            name: 'Classic Burger',
            imageUrl: '',
            quantity: 1,
            price: 12.0,
            selectedAddOns: [],
            specialInstructions: 'NO PICKLES',
          ),
        ],
        paymentStatus: PaymentStatus.pending,
        orderStatus: OrderStatus.preparing,
        totalAmount: 18.0,
        seatCount: 1,
        createdAt: DateTime.now().subtract(
          const Duration(minutes: 8, seconds: 45),
        ),
        updatedAt: DateTime.now(),
      ),
      OrderModel(
        id: '199',
        tableNumber: '8',
        staffId: 'staff2',
        orderedMenu: [
          CartItemModel(
            foodId: '6',
            name: 'Calamari',
            imageUrl: '',
            quantity: 1,
            price: 9.0,
            selectedAddOns: [],
          ),
        ],
        paymentStatus: PaymentStatus.pending,
        orderStatus: OrderStatus.ready,
        totalAmount: 9.0,
        seatCount: 1,
        createdAt: DateTime.now().subtract(
          const Duration(minutes: 15, seconds: 30),
        ),
        updatedAt: DateTime.now(),
      ),
    ]);
  }

  @override
  Future<void> updateOrderStatus(String orderId, OrderStatus status) async {
    // Mock implementation
    return Future.delayed(const Duration(milliseconds: 500));
  }
}

import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:rms_shared_package/constants/db_constants.dart';
import 'package:rms_shared_package/enums/enums.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';

abstract class HomeRemoteDataSource {
  /// Streams all orders from the 'orders' collection.
  Stream<List<OrderModel>> getOrders();

  /// Updates the status of a specific order in Firestore.
  Future<void> updateOrderStatus(String orderId, OrderStatus status);

  /// Updates the preparation status of an individual item in an order.
  Future<void> updateItemPreparationStatus(
    String orderId,
    int itemIndex,
    bool isPrepared,
  );
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore firestore;

  HomeRemoteDataSourceImpl({required this.firestore});

  @override
  Stream<List<OrderModel>> getOrders() {
    return firestore
        .collection(OrderDbConstants.orders)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          final orders = <OrderModel>[];
          for (final doc in snapshot.docs) {
            try {
              final data = doc.data();
              final sanitizedData = _deepSanitizeMap(data);
              sanitizedData['id'] = doc.id;
              final order = OrderModel.fromJson(sanitizedData);

              final isSentToKitchen = sanitizedData['sentToKitchen'] == true;
              final isNotCompleted = order.orderStatus != OrderStatus.completed;

              if (isSentToKitchen && isNotCompleted) {
                orders.add(order);
              }
            } catch (e) {
              // Log parsing error but don't crash the whole stream
              debugPrint('Error parsing order document ${doc.id}: $e');
            }
          }
          return orders;
        });
  }

  @override
  Future<void> updateOrderStatus(String orderId, OrderStatus status) async {
    final docRef = firestore.collection(OrderDbConstants.orders).doc(orderId);

    if (status == OrderStatus.ready ||
        status == OrderStatus.served ||
        status == OrderStatus.completed) {
      final doc = await docRef.get();
      if (doc.exists) {
        final sanitizedData = _deepSanitizeMap(doc.data()!);
        sanitizedData['id'] = doc.id;
        final order = OrderModel.fromJson(sanitizedData);

        final updatedMenu = order.orderedMenu.map((item) {
          return CartItemModel(
            foodId: item.foodId,
            name: item.name,
            imageUrl: item.imageUrl,
            quantity: item.quantity,
            price: item.price,
            selectedPortion: item.selectedPortion,
            selectedAddOns: item.selectedAddOns,
            specialInstructions: item.specialInstructions,
            isSentToKitchen: item.isSentToKitchen,
            isPrepared: true,
          );
        }).toList();

        await docRef.update({
          'orderStatus': status.name,
          'orderedMenu': updatedMenu.map((e) => e.toJson()).toList(),
          'updatedAt': FieldValue.serverTimestamp(),
        });
        return;
      }
    }

    await docRef.update({
      'orderStatus': status.name,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<void> updateItemPreparationStatus(
    String orderId,
    int itemIndex,
    bool isPrepared,
  ) async {
    final docRef = firestore.collection(OrderDbConstants.orders).doc(orderId);
    final doc = await docRef.get();

    if (doc.exists) {
      try {
        final sanitizedData = _deepSanitizeMap(doc.data()!);
        sanitizedData['id'] = doc.id;
        final order = OrderModel.fromJson(sanitizedData);
        final updatedMenu = List<CartItemModel>.from(order.orderedMenu);

        if (itemIndex >= 0 && itemIndex < updatedMenu.length) {
          final item = updatedMenu[itemIndex];
          updatedMenu[itemIndex] = CartItemModel(
            foodId: item.foodId,
            name: item.name,
            imageUrl: item.imageUrl,
            quantity: item.quantity,
            price: item.price,
            selectedPortion: item.selectedPortion,
            selectedAddOns: item.selectedAddOns,
            specialInstructions: item.specialInstructions,
            isSentToKitchen: item.isSentToKitchen,
            isPrepared: isPrepared,
          );
        }

        await docRef.update({
          'orderedMenu': updatedMenu.map((e) => e.toJson()).toList(),
          'updatedAt': FieldValue.serverTimestamp(),
        });
      } catch (e) {
        debugPrint(
          'Error updating item preparation status for order $orderId: $e',
        );
        rethrow;
      }
    }
  }

  Map<String, dynamic> _deepSanitizeMap(Map<dynamic, dynamic> map) {
    final sanitized = <String, dynamic>{};
    map.forEach((key, value) {
      final stringKey = key.toString();
      if (value is Map) {
        sanitized[stringKey] = _deepSanitizeMap(value);
      } else if (value is List) {
        sanitized[stringKey] = value.map((item) {
          if (item is Map) {
            return _deepSanitizeMap(item);
          }
          return item;
        }).toList();
      } else {
        sanitized[stringKey] = value;
      }
    });
    return sanitized;
  }
}

import 'package:equatable/equatable.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';

/// Represents a grouping of identical items from different active orders.
class ConsolidatedItemModel extends Equatable {
  final String foodId;
  final String name;
  final int totalQuantity;

  /// The list of specific items that make up this total.
  /// Used to reference back to the original orders if needed.
  final List<CartItemModel> sourceItems;

  const ConsolidatedItemModel({
    required this.foodId,
    required this.name,
    required this.totalQuantity,
    required this.sourceItems,
  });

  /// Factory to aggregate items from a list of orders.
  static List<ConsolidatedItemModel> fromOrders(List<OrderModel> orders) {
    final Map<String, List<CartItemModel>> grouped = {};

    for (var order in orders) {
      for (var item in order.orderedMenu) {

        // Group by foodId. If portions/addons matter, the key should be more complex.
        // For now, grouping by foodId and name is sufficient.
        final key = '${item.foodId}_${item.name}';
        if (!grouped.containsKey(key)) {
          grouped[key] = [];
        }
        grouped[key]!.add(item);
      }
    }

    return grouped.entries.map((entry) {
      final items = entry.value;
      final totalQuantity = items.fold(0, (sum, item) => sum + item.quantity);
      return ConsolidatedItemModel(
        foodId: items.first.foodId,
        name: items.first.name,
        totalQuantity: totalQuantity,
        sourceItems: items,
      );
    }).toList();
  }

  @override
  List<Object?> get props => [foodId, name, totalQuantity, sourceItems];
}

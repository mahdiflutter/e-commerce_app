import 'package:e_commerce_app/data/model/order.dart';
import 'package:e_commerce_app/data/model/product.dart';
import 'package:e_commerce_app/util/api_exception.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class BasketDataSource {
  Future<void> addToBasket(ProductModel product);
  Future<List<OrderModel>> getOrders();
  Future<int> getTotalPrice();
  Future<void> increaseCount(String orderId);
  Future<void> decreaseCount(String orderId);
  Future<void> deleteOrder(String orderId);
}

class BasketDataSourceLocal extends BasketDataSource {
  var ordersBox = Hive.box<OrderModel>('orders');
  @override
  Future<void> addToBasket(ProductModel product) async {
    try {
      final OrderModel order = OrderModel(
        id: product.id,
        count: 1,
        discountPrice: product.discountPrice,
        name: product.name,
        persent: product.persent,
        garanty: 'گارانتی 18 ماهه اپل لند',
        realPrice: product.price,
        thumbnail: product.thumbnail,
      );
      await ordersBox.add(order);
      print('added with successfully♥');
    } catch (exception) {
      throw ApiException(error: 'order has not added to basket!', errorCode: 0);
    }
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    try {
      final List<OrderModel> orders = ordersBox.values.toList();
      print(orders.length);

      return orders;
    } catch (exception) {
      throw ApiException(error: 'Something went wrong!', errorCode: 0);
    }
  }

  @override
  Future<int> getTotalPrice() async {
    try {
      final List<OrderModel> orders = ordersBox.values.toList();
      int total = orders.fold(
        0,
        (previousValue, order) =>
            previousValue +
            ((order.realPrice! + order.discountPrice!) * order.count!),
      );

      return total;
    } catch (exception) {
      throw ApiException(error: 'Something went wrong!', errorCode: 0);
    }
  }

  @override
  Future<void> increaseCount(String orderId) async {
    try {
      //-----------------
      final List<OrderModel> allOrders = ordersBox.values.toList();
      allOrders.forEach((order) {
        if (order.id == orderId) {
          int lastCount = order.count!;
          lastCount += 1;
          order.count = lastCount;
        }
      });
      await ordersBox.clear();
      ordersBox.addAll(allOrders);
    } catch (exception) {
      throw ApiException(error: 'can not do that!', errorCode: 0);
    }
  }

  @override
  Future<void> decreaseCount(String orderId) async {
    try {
      //-----------------
      final List<OrderModel> allOrders = ordersBox.values.toList();
      allOrders.forEach((order) {
        if (order.id == orderId) {
          int lastCount = order.count!;
          lastCount -= 1;
          order.count = lastCount;
        }
      });
      await ordersBox.clear();
      ordersBox.addAll(allOrders);
    } catch (exception) {
      throw ApiException(error: 'can not do that!', errorCode: 0);
    }
  }

  @override
  Future<void> deleteOrder(String orderId) async {
    try {
      final List<OrderModel> allOrders = ordersBox.values.toList();
      final int selectedIndex =
          allOrders.indexWhere((element) => element.id == orderId);
      allOrders.removeAt(selectedIndex);

      await ordersBox.clear();
      ordersBox.addAll(allOrders);
    } catch (exception) {
      throw ApiException(error: 'Unable to delete order!', errorCode: 0);
    }
  }
}

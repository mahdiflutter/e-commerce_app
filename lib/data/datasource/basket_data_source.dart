import 'package:e_commerce_app/data/model/order.dart';
import 'package:e_commerce_app/data/model/product.dart';
import 'package:e_commerce_app/util/api_exception.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class BasketDataSource {
  Future<void> addToBasket(ProductModel product);
  Future<List<OrderModel>> getOrders();
  Future<int> getTotalPrice();
}

class BasketDataSourceLocal extends BasketDataSource {
  final ordersBox = Hive.box<OrderModel>('orders');
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
    } catch (exception) {
      throw ApiException(error: 'order has not added to basket!', errorCode: 0);
    }
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    try {
      List<OrderModel> orders = ordersBox.values.toList();

      return orders;
    } catch (exception) {
      throw ApiException(error: 'Something went wrong!', errorCode: 0);
    }
  }

  @override
  Future<int> getTotalPrice() async {
    try {
      List<OrderModel> orders = ordersBox.values.toList();
      int total = orders.fold(
        0,
        (previousValue, element) =>
            previousValue += (element.realPrice! + element.discountPrice!),
      );
      print(total);
      return total;
    } catch (exception) {
      throw ApiException(error: 'Something went wrong!', errorCode: 0);
    }
  }
}

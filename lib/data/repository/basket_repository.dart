import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/datasource/basket_data_source.dart';
import 'package:e_commerce_app/data/model/order.dart';
import 'package:e_commerce_app/data/model/product.dart';
import 'package:e_commerce_app/service/di.dart';

abstract class BasketRepository {
  Future<void> addToBasket(ProductModel product);
  Future<Either<String, List<OrderModel>>> getOrders();
  Future<int> getTotalOrders();
  Future<void> increaseCount(String orderId);
  Future<void> decreaseCount(String orderId);
  Future<void> deleteOrder(String orderId);
}

class BasketRepositoryLocal extends BasketRepository {
  final BasketDataSource _dataSource = locator.get();
  @override
  Future<void> addToBasket(ProductModel product) async {
    _dataSource.addToBasket(product);
  }

  @override
  Future<Either<String, List<OrderModel>>> getOrders() async {
    try {
      List<OrderModel> orders = await _dataSource.getOrders();
      print('sssssssssssssssss');
      print(orders.length);
      return Right(orders);
    } catch (exception) {
      return const Left('خطایی رخ داده است دوباره تلاش کنید!');
    }
  }

  @override
  Future<int> getTotalOrders() async {
    final int totalPrice = await _dataSource.getTotalPrice();
    return totalPrice;
  }

  @override
  Future<void> increaseCount(String orderId) async {
    try {
      await _dataSource.increaseCount(orderId);
    } catch (exception) {
      print('error');
    }
  }

  @override
  Future<void> decreaseCount(String orderId) async {
    try {
      await _dataSource.decreaseCount(orderId);
    } catch (exception) {
      print('error');
    }
  }

  @override
  Future<void> deleteOrder(String orderId) async {
    try {
      await _dataSource.deleteOrder(orderId);
    } catch (exception) {
      print('error');
    }
  }
}

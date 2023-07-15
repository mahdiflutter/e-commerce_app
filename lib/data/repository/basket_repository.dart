import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/datasource/basket_data_source.dart';
import 'package:e_commerce_app/data/model/order.dart';
import 'package:e_commerce_app/data/model/product.dart';
import 'package:e_commerce_app/service/di.dart';

abstract class BasketRepository {
  Future<void> addToBasket(ProductModel product);
  Future<Either<String, List<OrderModel>>> getOrders();
  Future<int> getTotalOrders();
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
      final List<OrderModel> orders = await _dataSource.getOrders();
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
}

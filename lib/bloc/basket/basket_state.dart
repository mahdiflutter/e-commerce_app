import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/model/order.dart';

class BasketState {}

class BasketInitState extends BasketState {}

class BasketResponseState extends BasketState {
  final Either<String, List<OrderModel>> ordersResponse;
  final int totalOrders;
  BasketResponseState({
    required this.ordersResponse,
    required this.totalOrders,
  });
}

class BasketLoadingState extends BasketState {}

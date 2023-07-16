import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/bloc/basket/basket_event.dart';
import 'package:e_commerce_app/bloc/basket/basket_state.dart';
import 'package:e_commerce_app/data/model/order.dart';
import 'package:e_commerce_app/data/repository/basket_repository.dart';
import 'package:e_commerce_app/service/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final BasketRepository _repository = locator.get();
  BasketBloc() : super(BasketInitState()) {
    on<BasketSendRequestEvent>((event, emit) async {
      Either<String, List<OrderModel>> ordersResponse =
          await _repository.getOrders();

      final int totalPrice = await _repository.getTotalOrders();

      emit(BasketResponseState(
        ordersResponse: ordersResponse,
        totalOrders: totalPrice,
      ));
    });
    on<BasketIncreaseCountEvent>((event, emit) async {
      await _repository.increaseCount(event.order.id!);
      Either<String, List<OrderModel>> ordersResponse =
          await _repository.getOrders();

      final int totalPrice = await _repository.getTotalOrders();

      emit(BasketResponseState(
        ordersResponse: ordersResponse,
        totalOrders: totalPrice,
      ));
    });
    on<BasketDecreaseCountEvent>((event, emit) async {
      await _repository.decreaseCount(event.order.id!);
      Either<String, List<OrderModel>> ordersResponse =
          await _repository.getOrders();

      final int totalPrice = await _repository.getTotalOrders();

      emit(BasketResponseState(
        ordersResponse: ordersResponse,
        totalOrders: totalPrice,
      ));
    });
    on<BasketDeleteOrderEvent>((event, emit) async {
      await _repository.deleteOrder(event.order.id!);
      Either<String, List<OrderModel>> ordersResponse =
          await _repository.getOrders();

      final int totalPrice = await _repository.getTotalOrders();

      emit(BasketResponseState(
        ordersResponse: ordersResponse,
        totalOrders: totalPrice,
      ));
    });
  }
}

import 'package:e_commerce_app/data/model/order.dart';

class BasketEvent {}

class BasketSendRequestEvent extends BasketEvent {}

//to increase count of order
class BasketIncreaseCountEvent extends BasketEvent {
  final OrderModel order;
  BasketIncreaseCountEvent({required this.order});
}

//to decrease count of order
class BasketDecreaseCountEvent extends BasketEvent {
  final OrderModel order;
  BasketDecreaseCountEvent({required this.order});
}

//to delete an order
class BasketDeleteOrderEvent extends BasketEvent {
  final OrderModel order;
  BasketDeleteOrderEvent({required this.order});
}

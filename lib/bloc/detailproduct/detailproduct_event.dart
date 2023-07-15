import 'package:e_commerce_app/data/model/product.dart';

class DetailProductEvent {}

class DetailProductSendRequestEvent extends DetailProductEvent {
  final String productId;
  final String categoryId;
  DetailProductSendRequestEvent({
    required this.productId,
    required this.categoryId,
  });
}

class AddToBasketEvent extends DetailProductEvent {
  final ProductModel? product;
  AddToBasketEvent({required this.product});
}

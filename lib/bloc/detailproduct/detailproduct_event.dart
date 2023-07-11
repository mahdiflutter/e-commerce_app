class DetailProductEvent {}

class DetailProductSendRequestEvent extends DetailProductEvent {
  final String productId;
  final String categoryId;
  DetailProductSendRequestEvent({
    required this.productId,
    required this.categoryId,
  });
}

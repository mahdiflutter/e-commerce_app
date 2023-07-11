class ProductsByCategoryEvent {}

class ProductsByCategorySendReqEvent extends ProductsByCategoryEvent {
  final String categoryId;
  ProductsByCategorySendReqEvent({required this.categoryId});
}

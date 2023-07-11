import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/model/product.dart';

class ProductsByCategoryState {}

class ProductsByCategoryInitState extends ProductsByCategoryState {}

class ProductsByCategoryLoadingState extends ProductsByCategoryState {}

class ProductsByCategoryResponseState extends ProductsByCategoryState {
  final Either<String, List<ProductModel>> productsResponse;
  ProductsByCategoryResponseState({required this.productsResponse});
}

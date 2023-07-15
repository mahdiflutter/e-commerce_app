import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/model/category.dart';
import 'package:e_commerce_app/data/model/product_image.dart';
import 'package:e_commerce_app/data/model/productvariant.dart';
import 'package:e_commerce_app/data/model/property.dart';

class DetailProductState {}

class DetailProductInitState extends DetailProductState {}

class DetailProductLoadingState extends DetailProductState {}

class DetailProductResponseState extends DetailProductState {
  final Either<String, List<ProductImageModel>> images;
  final Either<String, List<ProductVariantModel>> productVariants;
  final Either<String, CategoryModel> categoryResponse;
  final Either<String, List<PropertyModel>> properties;
  DetailProductResponseState({
    required this.images,
    required this.productVariants,
    required this.categoryResponse,
    required this.properties,
  });
}

class AddedToBasketState extends DetailProductState {
  final Either<String, List<ProductImageModel>> images;
  final Either<String, List<ProductVariantModel>> productVariants;
  final Either<String, CategoryModel> categoryResponse;
  final Either<String, List<PropertyModel>> properties;
  AddedToBasketState({
    required this.images,
    required this.productVariants,
    required this.categoryResponse,
    required this.properties,
  });
}

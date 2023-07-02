import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/model/banner.dart';
import 'package:e_commerce_app/data/model/category.dart';
import 'package:e_commerce_app/data/model/product.dart';

class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeResponseState extends HomeState {
  final Either<String, List<BannerModel>> banners;
  final Either<String, List<CategoryModel>> categories;
  final Either<String, List<ProductModel>> firstProducts;
  final Either<String, List<ProductModel>> secondProducts;

  HomeResponseState({
    required this.banners,
    required this.categories,
    required this.firstProducts,
    required this.secondProducts,
  });
}

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/model/category.dart';

class CategoriesState {}

class CategoriesInitState extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesResponseState extends CategoriesState {
  final Either<String, List<CategoryModel>> categoriesResponse;
  CategoriesResponseState({
    required this.categoriesResponse,
  });
}

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/bloc/categories/categories_event.dart';
import 'package:e_commerce_app/bloc/categories/categories_state.dart';
import 'package:e_commerce_app/data/model/category.dart';
import 'package:e_commerce_app/data/repository/category_repository.dart';
import 'package:e_commerce_app/service/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoryRepository _repository = locator.get();
  CategoriesBloc() : super(CategoriesInitState()) {
    on<CategoriesSendRequestEvent>(
      (event, emit) async {
        emit(
          CategoriesLoadingState(),
        );
        final Either<String, List<CategoryModel>> categories =
            await _repository.getAllCategories();
        emit(
          CategoriesResponseState(categoriesResponse: categories),
        );
      },
    );
  }
}

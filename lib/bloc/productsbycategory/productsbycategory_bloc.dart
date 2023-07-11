import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/bloc/productsbycategory/productsbycategory_event.dart';
import 'package:e_commerce_app/bloc/productsbycategory/productsbycategory_state.dart';
import 'package:e_commerce_app/data/model/product.dart';
import 'package:e_commerce_app/data/repository/products_repository.dart';
import 'package:e_commerce_app/service/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsByCategoryBloc
    extends Bloc<ProductsByCategoryEvent, ProductsByCategoryState> {
  final ProductsRepository _repository = locator.get();
  ProductsByCategoryBloc() : super(ProductsByCategoryInitState()) {
    on<ProductsByCategorySendReqEvent>((event, emit) async {
      emit(ProductsByCategoryLoadingState());
      final Either<String, List<ProductModel>> productsResponse =
          await _repository.getProductsByFilter(
              key: 'category', value: event.categoryId);
      emit(
        ProductsByCategoryResponseState(productsResponse: productsResponse),
      );
    });
  }
}

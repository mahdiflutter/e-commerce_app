import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/bloc/detailproduct/detailproduct_event.dart';
import 'package:e_commerce_app/bloc/detailproduct/detailproduct_state.dart';
import 'package:e_commerce_app/data/model/category.dart';
import 'package:e_commerce_app/data/model/product_image.dart';
import 'package:e_commerce_app/data/model/productvariant.dart';
import 'package:e_commerce_app/data/model/property.dart';
import 'package:e_commerce_app/data/repository/basket_repository.dart';
import 'package:e_commerce_app/data/repository/detailproduct_repository.dart';
import 'package:e_commerce_app/service/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  final DetailProductRepository _repository = locator.get();
  final BasketRepository _basketRepository = locator.get();
  DetailProductBloc() : super(DetailProductInitState()) {
    on<DetailProductSendRequestEvent>((event, emit) async {
      emit(
        DetailProductLoadingState(),
      );
      final Either<String, List<ProductImageModel>> imagesResponse =
          await _repository.getImages(
        event.productId,
      );
      final Either<String, List<ProductVariantModel>> variantsResponse =
          await _repository.getProductVariants(event.productId);
      final Either<String, CategoryModel> categoryResponse =
          await _repository.getCategory(event.categoryId);
      final Either<String, List<PropertyModel>> propertiesResponse =
          await _repository.getProperties(event.productId);
      emit(
        DetailProductResponseState(
          images: imagesResponse,
          productVariants: variantsResponse,
          categoryResponse: categoryResponse,
          properties: propertiesResponse,
        ),
      );
    });
    on<AddToBasketEvent>(
      (event, emit) async {
        emit(
          DetailProductLoadingState(),
        );
        final Either<String, List<ProductImageModel>> imagesResponse =
            await _repository.getImages(
          event.product!.id!,
        );
        final Either<String, List<ProductVariantModel>> variantsResponse =
            await _repository.getProductVariants(event.product!.id!);
        final Either<String, CategoryModel> categoryResponse =
            await _repository.getCategory(event.product!.category!);
        final Either<String, List<PropertyModel>> propertiesResponse =
            await _repository.getProperties(event.product!.id!);
        await _basketRepository.addToBasket(event.product!);
        emit(
          AddedToBasketState(
            categoryResponse: categoryResponse,
            images: imagesResponse,
            productVariants: variantsResponse,
            properties: propertiesResponse,
          ),
        );
      },
    );
  }
}

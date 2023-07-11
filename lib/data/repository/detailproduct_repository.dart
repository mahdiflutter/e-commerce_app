import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/datasource/detailproduct_data_source.dart';
import 'package:e_commerce_app/data/model/category.dart';
import 'package:e_commerce_app/data/model/product_image.dart';
import 'package:e_commerce_app/data/model/productvariant.dart';
import 'package:e_commerce_app/service/di.dart';
import 'package:e_commerce_app/util/api_exception.dart';
import 'package:e_commerce_app/data/model/property.dart';

abstract class DetailProductRepository {
  Future<Either<String, List<ProductImageModel>>> getImages(String productId);
  Future<Either<String, List<ProductVariantModel>>> getProductVariants(
    String productId,
  );
  Future<Either<String, CategoryModel>> getCategory(String categoryId);
  Future<Either<String, List<PropertyModel>>> getProperties(String productId);
}

class DetailProductRepositoryNetwork extends DetailProductRepository {
  final DetailProductDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<ProductImageModel>>> getImages(
      String productId) async {
    try {
      List<ProductImageModel> images = await _dataSource.getGallery(productId);
      return Right(images);
    } on ApiException catch (exception) {
      return const Left('در ارتیاط با سرور خطایی رخ داد!');
    }
  }

  @override
  Future<Either<String, List<ProductVariantModel>>> getProductVariants(
      String productId) async {
    try {
      final List<ProductVariantModel> productVariants =
          await _dataSource.getProductVariants(productId);
      return Right(productVariants);
    } catch (exception) {
      return const Left('خطایی رخ داد!');
    }
  }

  @override
  Future<Either<String, CategoryModel>> getCategory(String categoryId) async {
    try {
      final CategoryModel response = await _dataSource.getCategory(categoryId);
      return Right(response);
    } catch (exception) {
      return const Left('خطایی رخ داد!');
    }
  }

  @override
  Future<Either<String, List<PropertyModel>>> getProperties(
      String productId) async {
    try {
      final List<PropertyModel> response =
          await _dataSource.getProperties(productId);
      return Right(response);
    } catch (exception) {
      return const Left('در ارتباط با سرور خطایی رخ داد!');
    }
  }
}

import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/model/category.dart';
import 'package:e_commerce_app/data/model/product_image.dart';
import 'package:e_commerce_app/data/model/productvariant.dart';
import 'package:e_commerce_app/data/model/property.dart';
import 'package:e_commerce_app/data/model/variant.dart';
import 'package:e_commerce_app/data/model/variant_type.dart';
import 'package:e_commerce_app/service/di.dart';
import 'package:e_commerce_app/util/api_exception.dart';

abstract class DetailProductDataSource {
  Future<List<ProductImageModel>> getGallery(String productId);
  Future<List<VariantTypeModel>> getVariantTypes();
  Future<List<VariantModel>> getVariants(String productId);
  Future<List<ProductVariantModel>> getProductVariants(String productId);
  Future<CategoryModel> getCategory(String categoryId);
  Future<List<PropertyModel>> getProperties(String productId);
}

class DetailProductDataSourceNetwork extends DetailProductDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<ProductImageModel>> getGallery(String productId) async {
    try {
      var response = await _dio.get(
        'collections/gallery/records',
        queryParameters: {'filter': 'product_id="$productId"'},
      );
      final List<ProductImageModel> images = response.data['items']
          .map<ProductImageModel>(
            (map) => ProductImageModel.fromMap(map),
          )
          .toList();
      return images;
    } on DioException catch (exception) {
      throw ApiException(
        error: exception.response!.statusMessage!,
        errorCode: exception.response!.statusCode!,
      );
    } catch (exception) {
      throw ApiException(error: 'Uknown error!', errorCode: 0);
    }
  }

  @override
  Future<List<VariantTypeModel>> getVariantTypes() async {
    try {
      var response = await _dio.get('collections/variants_type/records');
      final List<VariantTypeModel> variantTypes = response.data['items']
          .map<VariantTypeModel>(
            (map) => VariantTypeModel.fromMap(map),
          )
          .toList();
      return variantTypes;
    } on DioException catch (exception) {
      throw ApiException(
        error: exception.response!.statusMessage!,
        errorCode: exception.response!.statusCode!,
      );
    } catch (exception) {
      throw ApiException(error: 'Uknown error!', errorCode: 0);
    }
  }

  @override
  Future<List<VariantModel>> getVariants(String productId) async {
    try {
      var response = await _dio.get(
        'collections/variants/records',
        queryParameters: {
          'filter': 'product_id="$productId"',
        },
      );
      final List<VariantModel> variants = response.data['items']
          .map<VariantModel>(
            (map) => VariantModel.fromMap(map),
          )
          .toList();
      return variants;
    } on DioException catch (exception) {
      throw ApiException(
        error: exception.response!.statusMessage!,
        errorCode: exception.response!.statusCode!,
      );
    } catch (exception) {
      throw ApiException(error: 'Uknown error!', errorCode: 0);
    }
  }

  @override
  Future<List<ProductVariantModel>> getProductVariants(String productId) async {
    try {
      final List<VariantTypeModel> variantTypes = await getVariantTypes();
      final List<VariantModel> variants = await getVariants(productId);
      List<ProductVariantModel> productVariants = [];
      for (var variantType in variantTypes) {
        List<VariantModel> allVariants = variants
            .where(
              (variant) => variant.typeId == variantType.id,
            )
            .toList();
        productVariants.add(
          ProductVariantModel(variantType: variantType, variants: allVariants),
        );
      }
      return productVariants;
    } catch (exception) {
      throw ApiException(error: 'Uknown Error!', errorCode: 0);
    }
  }

  @override
  Future<CategoryModel> getCategory(String categoryId) async {
    try {
      var response = await _dio.get(
        'collections/category/records',
        queryParameters: {'filter': 'id="$categoryId"'},
      );
      final CategoryModel category =
          CategoryModel.fromMap(response.data['items'][0]);
      return category;
    } catch (exception) {
      throw ApiException(error: 'Uknown Error!', errorCode: 0);
    }
  }

  @override
  Future<List<PropertyModel>> getProperties(String productId) async {
    try {
      var response = await _dio.get(
        'collections/properties/records',
        queryParameters: {'filter': 'product_id="$productId"'},
      );
      final List<PropertyModel> properties = response.data['items']
          .map<PropertyModel>(
            (map) => PropertyModel.fromMap(map),
          )
          .toList();

      return properties;
    } catch (exception) {
      throw ApiException(error: 'Uknown Error!', errorCode: 0);
    }
  }
}

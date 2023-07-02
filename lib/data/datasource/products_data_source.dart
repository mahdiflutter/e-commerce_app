import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/model/product.dart';
import 'package:e_commerce_app/service/di.dart';
import 'package:e_commerce_app/util/api_exception.dart';

abstract class ProductsDataSource {
  Future<List<ProductModel>> getProductsByFilter({required String filter});
}

class ProductsDataSourceNetwork extends ProductsDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<ProductModel>> getProductsByFilter(
      {required String filter}) async {
    try {
      var response = await _dio.get(
        'collections/products/records',
        queryParameters: {'filter': 'popularity="$filter"'},
      );
      final List<ProductModel> products = response.data['items']
          .map<ProductModel>((map) => ProductModel.fromMap(map))
          .toList();
      return products;
    } on DioException catch (exception) {
      throw ApiException(
        error: exception.response!.statusMessage!,
        errorCode: exception.response!.statusCode!,
      );
    } catch (exception) {
      throw ApiException(error: 'Uknown error!', errorCode: 0);
    }
  }
}

import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/model/category.dart';
import 'package:e_commerce_app/service/di.dart';
import 'package:e_commerce_app/util/api_exception.dart';

abstract class CategoryDataSource {
  Future<List<CategoryModel>> getAllCategories();
}

class CategoryDataSourceNetwork extends CategoryDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      var response = await _dio.get('collections/category/records');
      List<CategoryModel> categories = response.data['items']
          .map<CategoryModel>((map) => CategoryModel.fromMap(map))
          .toList();
      return categories;
    } on DioException catch (exception) {
      throw ApiException(
        error: exception.response!.statusMessage!,
        errorCode: exception.response!.statusCode!,
      );
    } catch (exception) {
      throw ApiException(error: 'Uknown Error!', errorCode: 0);
    }
  }
}

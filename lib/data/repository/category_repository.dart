import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/datasource/category_data_source.dart';
import 'package:e_commerce_app/data/model/category.dart';
import 'package:e_commerce_app/service/di.dart';

abstract class CategoryRepository {
  Future<Either<String, List<CategoryModel>>> getAllCategories();
}

class CategoryRepositoryNetwork extends CategoryRepository {
  final CategoryDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<CategoryModel>>> getAllCategories() async {
    try {
      List<CategoryModel> result = await _dataSource.getAllCategories();
      return Right(result);
    } on DioException catch (exception) {
      return const Left('در ارتیاط با سرور خطایی رخ دادٌ!');
    } catch (exception) {
      return const Left('خطایی نا مشخص رخ داد!');
    }
  }
}

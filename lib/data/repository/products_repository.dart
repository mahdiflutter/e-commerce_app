import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/datasource/products_data_source.dart';
import 'package:e_commerce_app/data/model/product.dart';
import 'package:e_commerce_app/service/di.dart';
import 'package:e_commerce_app/util/api_exception.dart';

abstract class ProductsRepository {
  Future<Either<String, List<ProductModel>>> getProductsByFilter(
      {required String filter});
}

class ProductsRepositoryNetwork extends ProductsRepository {
  final ProductsDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<ProductModel>>> getProductsByFilter(
      {required String filter}) async {
    try {
      final List<ProductModel> resposne =
          await _dataSource.getProductsByFilter(filter: filter);
      return Right(resposne);
    } on ApiException catch (exception) {
      return const Left('در ارتباط با سرور خطایی رخ داد!');
    } catch (exception) {
      return const Left('خطایی ناشناخته رخ داد!');
    }
  }
}

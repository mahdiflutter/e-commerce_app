import 'package:e_commerce_app/bloc/basket/basket_bloc.dart';
import 'package:e_commerce_app/data/datasource/banners_data_source.dart';
import 'package:e_commerce_app/data/datasource/basket_data_source.dart';
import 'package:e_commerce_app/data/datasource/category_data_source.dart';
import 'package:e_commerce_app/data/datasource/detailproduct_data_source.dart';
import 'package:e_commerce_app/data/datasource/products_data_source.dart';
import 'package:e_commerce_app/data/repository/banners_repository.dart';
import 'package:e_commerce_app/data/repository/basket_repository.dart';
import 'package:e_commerce_app/data/repository/category_repository.dart';
import 'package:e_commerce_app/data/repository/detailproduct_repository.dart';
import 'package:e_commerce_app/data/repository/products_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

var locator = GetIt.instance;
Future<void> initGetIt() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'http://startflutter.ir/api/'),
    ),
  );
  //Data Sources
  locator.registerSingleton<BannersDataSource>(
    BannersDataSourceNetwork(),
  );
  locator.registerSingleton<CategoryDataSource>(
    CategoryDataSourceNetwork(),
  );
  locator.registerSingleton<ProductsDataSource>(
    ProductsDataSourceNetwork(),
  );
  locator.registerSingleton<DetailProductDataSource>(
    DetailProductDataSourceNetwork(),
  );
  locator.registerSingleton<BasketDataSource>(
    BasketDataSourceLocal(),
  );

  //Repositories
  locator.registerSingleton<BannersRepository>(
    BannersRepositoryNetwork(),
  );
  locator.registerSingleton<CategoryRepository>(
    CategoryRepositoryNetwork(),
  );
  locator.registerSingleton<ProductsRepository>(
    ProductsRepositoryNetwork(),
  );
  locator.registerSingleton<DetailProductRepository>(
    DetailProductRepositoryNetwork(),
  );
  locator.registerSingleton<BasketRepository>(
    BasketRepositoryLocal(),
  );

  //bloc
  locator.registerSingleton<BasketBloc>(BasketBloc());
}

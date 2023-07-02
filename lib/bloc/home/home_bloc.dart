import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/bloc/home/home_event.dart';
import 'package:e_commerce_app/bloc/home/home_state.dart';
import 'package:e_commerce_app/data/model/banner.dart';
import 'package:e_commerce_app/data/model/category.dart';
import 'package:e_commerce_app/data/model/product.dart';
import 'package:e_commerce_app/data/repository/banners_repository.dart';
import 'package:e_commerce_app/data/repository/category_repository.dart';
import 'package:e_commerce_app/data/repository/products_repository.dart';
import 'package:e_commerce_app/service/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BannersRepository _bannersRepository = locator.get();
  final CategoryRepository _categoryRepository = locator.get();
  final ProductsRepository _productsRepository = locator.get();
  HomeBloc() : super(HomeInitState()) {
    on<HomeSendRequestEvent>((event, emit) async {
      emit(HomeLoadingState());
      Either<String, List<BannerModel>> bannersResponse =
          await _bannersRepository.getAllBanners();
      Either<String, List<CategoryModel>> categoriesResponse =
          await _categoryRepository.getAllCategories();
      Either<String, List<ProductModel>> firstProducts =
          await _productsRepository.getProductsByFilter(
        filter: 'Best Seller',
      );
      Either<String, List<ProductModel>> secondProducts =
          await _productsRepository.getProductsByFilter(
        filter: 'Hotest',
      );
      emit(
        HomeResponseState(
          banners: bannersResponse,
          categories: categoriesResponse,
          firstProducts: firstProducts,
          secondProducts: secondProducts,
        ),
      );
    });
  }
}

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/datasource/banners_data_source.dart';
import 'package:e_commerce_app/data/model/banner.dart';
import 'package:e_commerce_app/service/di.dart';
import 'package:e_commerce_app/util/api_exception.dart';

abstract class BannersRepository {
  Future<Either<String, List<BannerModel>>> getAllBanners();
}

class BannersRepositoryNetwork extends BannersRepository {
  final BannersDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<BannerModel>>> getAllBanners() async {
    try {
      List<BannerModel> response = await _dataSource.getAllBanners();

      return Right(response);
    } on ApiException catch (exception) {
      return Left(exception.error);
    } catch (exception) {
      return const Left('خطای نامشخصی رخ داد!');
    }
  }
}

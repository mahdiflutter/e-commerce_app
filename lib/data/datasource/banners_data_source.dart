import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/model/banner.dart';
import 'package:e_commerce_app/service/di.dart';
import 'package:e_commerce_app/util/api_exception.dart';

abstract class BannersDataSource {
  Future<List<BannerModel>> getAllBanners();
}

class BannersDataSourceNetwork extends BannersDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<BannerModel>> getAllBanners() async {
    try {
      var dio = Dio();
      var response = await _dio.get('collections/banner/records');
      var result = response.data['items']
          .map<BannerModel>((map) => BannerModel.fromMap(map))
          .toList();
      return result;
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

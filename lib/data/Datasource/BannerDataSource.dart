
import 'package:dio/dio.dart';
import 'package:rizino/data/Model/Banner.dart';
import 'package:rizino/di/di.dart';
import 'package:rizino/utils/api_exception.dart';



abstract class IBannerDataSource {
  Future<List<BannerCampain>> GetBanners();
}

class BannerRemoteDataSource extends IBannerDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<BannerCampain>> GetBanners() async {
    try {
      var response = await _dio.get('collections/CategoryImage/records');
      return response.data['items']
          .map<BannerCampain>(
              (jsonObject) => BannerCampain.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }
}


import 'package:dio/dio.dart';
import 'package:rizino/data/Model/Ads.dart';
import 'package:rizino/data/Model/Banner.dart';
import 'package:rizino/di/di.dart';
import 'package:rizino/utils/api_exception.dart';



abstract class IAdsDataSource {
  Future<List<Ads>> GetAds();
}

class AdsRemoteDataSource extends IAdsDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<Ads>> GetAds() async {
    try {
      var response = await _dio.get('collections/Ads/records');
      return response.data['items']
          .map<Ads>(
              (jsonObject) => Ads.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }
}

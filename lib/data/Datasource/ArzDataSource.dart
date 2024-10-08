
import 'package:dio/dio.dart';
import 'package:rizino/data/Model/Arz.dart';
import 'package:rizino/data/Model/Banner.dart';
import 'package:rizino/di/di.dart';
import 'package:rizino/utils/api_exception.dart';



abstract class IArzDataSource {
  Future<List<Arz>> GetArzs();
}

class ArzRemoteDataSource extends IArzDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<Arz>> GetArzs() async {
    try {
      var response = await _dio.get('collections/cedarPrices/records');
      return response.data['items']
          .map<Arz>(
              (jsonObject) => Arz.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }
}

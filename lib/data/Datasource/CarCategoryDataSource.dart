
import 'package:dio/dio.dart';
import 'package:rizino/data/Model/Banner.dart';
import 'package:rizino/data/Model/CarCategory.dart';
import 'package:rizino/di/di.dart';
import 'package:rizino/utils/api_exception.dart';



abstract class ICarCategoryDataSource {
  Future<List<CarCategory>> GetCategory();
}

class CarCategoryRemoteDataSource extends ICarCategoryDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<CarCategory>> GetCategory() async {
    try {
      var response = await _dio.get('collections/Category/records');
      return response.data['items']
          .map<CarCategory>(
              (jsonObject) => CarCategory.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }
}

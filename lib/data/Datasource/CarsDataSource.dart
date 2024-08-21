
import 'package:dio/dio.dart';
import 'package:rizino/data/Model/Car.dart';
import 'package:rizino/data/Model/CarCategory.dart';
import 'package:rizino/di/di.dart';
import 'package:rizino/utils/api_exception.dart';

abstract class ICarDataSource {
  Future<List<Car>> getCars(String productId);
  Future<List<CarCategory>> getCarCategory(String categoryId);
}

class CarRemoteDataSource extends ICarDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<Car>> getCars(String productId) async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="$productId"'};

      var response = await _dio.get('collections/carPrice/records',
          queryParameters: qParams);
      return response.data['items']
          .map<Car>((jsonObject) => Car.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }
  @override
  Future<List<CarCategory>> getCarCategory(String categoryId) async {
    try {
      Map<String, String> qParams = {'filter': 'id="$categoryId"'};
      var response = await _dio.get('collections/category/records',
          queryParameters: qParams);
      return response.data['items']
          .map<CarCategory>((jsonObject) => CarCategory.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }
  

}

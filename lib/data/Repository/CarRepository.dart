
import 'package:dartz/dartz.dart';
import 'package:rizino/data/Datasource/CarsDataSource.dart';
import 'package:rizino/data/Model/Car.dart';
import 'package:rizino/data/Model/CarCategory.dart';
import 'package:rizino/di/di.dart';

abstract class ICarRepository {
  Future<Either<String, List<Car>>> getCars(String productId);

  Future<Either<String, List<CarCategory>>> getCarCategory(String categoryId);
}

class CarRepository extends ICarRepository {
  final ICarDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<Car>>> getCars(String productId) async {
    try {
      var response = await _dataSource.getCars(productId);
      return right(response);
    } catch (ex) {
      return left('خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<CarCategory>>> getCarCategory(String categoryId) async {
    try {
      var response = await _dataSource.getCarCategory(categoryId);
      return right(response);
    } catch (ex) {
      return left('خطا محتوای متنی ندارد');
    }
  }

}

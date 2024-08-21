


import 'package:dartz/dartz.dart';
import 'package:rizino/data/Datasource/BannerDataSource.dart';
import 'package:rizino/data/Datasource/CarCategoryDataSource.dart';
import 'package:rizino/data/Model/Banner.dart';
import 'package:rizino/data/Model/CarCategory.dart';
import 'package:rizino/di/di.dart';

abstract class ICarCategoryRepository {
  Future<Either<String, List<CarCategory>>> GetCarCategory();
}

class CarCategoryRepository extends ICarCategoryRepository {
  final ICarCategoryDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<CarCategory>>> GetCarCategory() async {
    try {
      var response = await _dataSource.GetCategory();
      return right(response);
    } catch (ex) {
      return left('خطا محتوای متنی ندارد');
    }
  }
}

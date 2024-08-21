


import 'package:dartz/dartz.dart';
import 'package:rizino/data/Datasource/ArzDataSource.dart';
import 'package:rizino/data/Datasource/BannerDataSource.dart';
import 'package:rizino/data/Model/Arz.dart';
import 'package:rizino/data/Model/Banner.dart';
import 'package:rizino/di/di.dart';

abstract class IArzRepository {
  Future<Either<String, List<Arz>>> GetArzs();
}

class ArzRepository extends IArzRepository {
  final IArzDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<Arz>>> GetArzs() async {
    try {
      var response = await _dataSource.GetArzs();
      return right(response);
    } catch (ex) {
      return left('خطا محتوای متنی ندارد');
    }
  }
}

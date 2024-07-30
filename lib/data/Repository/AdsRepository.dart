


import 'package:dartz/dartz.dart';
import 'package:rizino/data/Datasource/AdsDatasource.dart';
import 'package:rizino/data/Datasource/BannerDataSource.dart';
import 'package:rizino/data/Model/Ads.dart';
import 'package:rizino/data/Model/Banner.dart';
import 'package:rizino/di/di.dart';

abstract class IAdsRepository {
  Future<Either<String, List<Ads>>> GetAds();
}

class AdsRepository extends IAdsRepository {
  final IAdsDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<Ads>>> GetAds() async {
    try {
      var response = await _dataSource.GetAds();
      return right(response);
    } catch (ex) {
      return left('خطا محتوای متنی ندارد');
    }
  }
}

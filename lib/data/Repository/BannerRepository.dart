


import 'package:dartz/dartz.dart';
import 'package:rizino/data/Datasource/BannerDataSource.dart';
import 'package:rizino/data/Model/Banner.dart';
import 'package:rizino/di/di.dart';

abstract class IBannerRepository {
  Future<Either<String, List<BannerCampain>>> GetBanners();
}

class BannerRepository extends IBannerRepository {
  final IBannerDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<BannerCampain>>> GetBanners() async {
    try {
      var response = await _dataSource.GetBanners();
      return right(response);
    } catch (ex) {
      return left('خطا محتوای متنی ندارد');
    }
  }
}

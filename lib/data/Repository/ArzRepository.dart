


// import 'package:dartz/dartz.dart';
// import 'package:rizino/data/Datasource/ArzDataSource.dart';
// import 'package:rizino/data/Datasource/BannerDataSource.dart';
// import 'package:rizino/data/Model/Arz.dart';
// import 'package:rizino/data/Model/Banner.dart';
// import 'package:rizino/di/di.dart';

// abstract class IArzRepository {
//   Future<Either<String, List<Arz>>> GetArz();
// }

// class ArzRepository extends IArzRepository {
//   final IArzDataSource _dataSource = locator.get();
//   @override
//   Future<Either<String, List<Arz>>> GetArz() async {
//     try {
//       var response = await _dataSource.GetArz();
//       return right(response);
//     } catch (ex) {
//       return left('خطا محتوای متنی ندارد');
//     }
//   }
// }

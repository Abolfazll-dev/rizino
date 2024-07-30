
// import 'package:dio/dio.dart';
// import 'package:rizino/data/Model/Arz.dart';
// import 'package:rizino/data/Model/Banner.dart';
// import 'package:rizino/di/di.dart';
// import 'package:rizino/utils/api_exception.dart';



// abstract class IArzDataSource {
//   Future<List<Arz>> GetArz();
// }

// class ArzRemoteDataSource extends IArzDataSource {
//   final Dio _dio = Dio(BaseOptions(baseUrl: 'https://nerkh-api.ir/api/'));

//   @override
//   Future<List<Arz>> GetArz() async {
//     try {
//       var response = await _dio.get('55dd7bf36165068ede08dfbf61fb1839/currency/');
//       return response.data['items']['prices']
//           .map<Arz>(
//               (jsonObject) => Arz.fromMapJson(jsonObject))
//           .toList();
//     } on DioError catch (ex) {
//       throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
//     } catch (ex) {
//       throw ApiException(0, 'Unknown Error');
//     }
//   }
// }

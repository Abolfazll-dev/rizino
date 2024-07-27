import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rizino/data/Datasource/ArzDataSource.dart';
import 'package:rizino/data/Datasource/BannerDataSource.dart';
import 'package:rizino/data/Repository/ArzRepository.dart';
import 'package:rizino/data/Repository/BannerRepository.dart';

import 'package:shared_preferences/shared_preferences.dart';

var locator2 = GetIt.instance;
Future<void> getItInit2() async {
  locator2.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'https://nerkh-api.ir/api/')));
      

  locator2.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance()
  );
  // Datasource
  locator2.registerFactory<IArzDataSource>(() => ArzRemoteDataSource());

  // Repository
  locator2.registerFactory<IArzRepository>(() => ArzRepository());

// Bloc _________
}

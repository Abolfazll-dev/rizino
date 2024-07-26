import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rizino/data/Datasource/BannerDataSource.dart';
import 'package:rizino/data/Repository/BannerRepository.dart';

import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'https://rizinoo.chbk.run/api/')));
      

  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance()
  );
  // Datasource
  locator.registerFactory<IBannerDataSource>(() => BannerRemoteDataSource());

  // Repository
  locator.registerFactory<IBannerRepository>(() => BannerRepository());

// Bloc _________
}

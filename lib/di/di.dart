import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rizino/data/Datasource/AdsDatasource.dart';
import 'package:rizino/data/Datasource/ArzDataSource.dart';
import 'package:rizino/data/Datasource/BannerDataSource.dart';
import 'package:rizino/data/Datasource/CarsDataSource.dart';
import 'package:rizino/data/Repository/AdsRepository.dart';
import 'package:rizino/data/Repository/ArzRepository.dart';
import 'package:rizino/data/Repository/BannerRepository.dart';
import 'package:rizino/data/Repository/CarRepository.dart';

import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'https://rizinoo.chbk.run/api/')));

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  // Datasource
  locator.registerFactory<IArzDataSource>(() => ArzRemoteDataSource());

  locator.registerFactory<IBannerDataSource>(() => BannerRemoteDataSource());
  locator.registerFactory<IAdsDataSource>(() => AdsRemoteDataSource());
  locator.registerFactory<ICarDataSource>(() => CarRemoteDataSource());

  // Repository
  locator.registerFactory<IBannerRepository>(() => BannerRepository());
  locator.registerFactory<IAdsRepository>(() => AdsRepository());
  locator.registerFactory<IArzRepository>(() => ArzRepository());
  locator.registerFactory<ICarRepository>(() => CarRepository());

// Bloc _________
}

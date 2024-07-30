import 'package:dartz/dartz.dart';
import 'package:rizino/data/Model/Ads.dart';
import 'package:rizino/data/Model/Arz.dart';
import 'package:rizino/data/Model/Banner.dart';


abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeInitState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<BannerCampain>> bannerList;
  Either<String, List<Ads>> adsList;
  // Either<String, List<Arz>> arzList;

  HomeRequestSuccessState(
    this.bannerList,
    this.adsList,
    // this.arzList,

  );
}

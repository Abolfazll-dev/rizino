import 'package:dartz/dartz.dart';
import 'package:rizino/data/Model/Banner.dart';


abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeInitState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<BannerCampain>> bannerList;

  HomeRequestSuccessState(
    this.bannerList,

  );
}

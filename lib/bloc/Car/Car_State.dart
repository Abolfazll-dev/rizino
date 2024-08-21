import 'package:dartz/dartz.dart';
import 'package:rizino/data/Model/Ads.dart';
import 'package:rizino/data/Model/Arz.dart';
import 'package:rizino/data/Model/Banner.dart';

import '../../data/Model/Car.dart';


abstract class CarState {}

class CarLoadingState extends CarState {}

class CarInitState extends CarState {}

class CarRequestSuccessState extends CarState {
  Either<String, List<Car>> iranKhodroList;
  Either<String, List<Car>> saipaList;


  CarRequestSuccessState(
    this.iranKhodroList,
    this.saipaList,


  );
}

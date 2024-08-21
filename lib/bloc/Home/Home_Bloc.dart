import 'package:bloc/bloc.dart';
import 'package:rizino/bloc/Home/Home_Event.dart';
import 'package:rizino/bloc/Home/Home_State.dart';
import 'package:rizino/data/Repository/AdsRepository.dart';
import 'package:rizino/data/Repository/ArzRepository.dart';
import 'package:rizino/data/Repository/BannerRepository.dart';
import 'package:rizino/data/Repository/CarRepository.dart';
import 'package:rizino/di/di.dart';



class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  final IAdsRepository _adsRepository = locator.get();
  final IArzRepository _arzRepository = locator.get();
  final ICarRepository _carRepository = locator.get();

  HomeBloc() : super(HomeInitState()) {
    on<HomeGetInitData>((event, emit) async {
      emit(HomeLoadingState());

      var bannerList = await _bannerRepository.GetBanners();
      var adsList = await _adsRepository.GetAds();
      var arzList = await _arzRepository.GetArzs();


      emit(HomeRequestSuccessState(bannerList,adsList,arzList));
    });
  }
}

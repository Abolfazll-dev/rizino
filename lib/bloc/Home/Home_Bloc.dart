import 'package:bloc/bloc.dart';
import 'package:rizino/bloc/Home/Home_Event.dart';
import 'package:rizino/bloc/Home/Home_State.dart';
import 'package:rizino/data/Repository/ArzRepository.dart';
import 'package:rizino/data/Repository/BannerRepository.dart';
import 'package:rizino/di/di.dart';
import 'package:rizino/di/dio-Arz-Api.dart';



class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  final IArzRepository _arzRepository = locator2.get();

  HomeBloc() : super(HomeInitState()) {
    on<HomeGetInitData>((event, emit) async {
      emit(HomeLoadingState());

      var bannerList = await _bannerRepository.GetBanners();
      var arzList = await _arzRepository.GetArz();


      emit(HomeRequestSuccessState(bannerList,arzList));
    });
  }
}

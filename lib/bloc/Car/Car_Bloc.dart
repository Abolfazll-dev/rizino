
import 'package:bloc/bloc.dart';
import 'package:rizino/bloc/Car/Car_Event.dart';
import 'package:rizino/bloc/Car/Car_State.dart';
import 'package:rizino/data/Repository/CarCategoryRepository.dart';
import 'package:rizino/data/Repository/CarRepository.dart';
import 'package:rizino/di/di.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final ICarRepository _carRepository = locator.get();
  final ICarCategoryRepository _carCategoryRepository = locator.get();
  CarBloc() : super(CarInitState()) {
    on<CarInitEvent>((event, emit) async {
      emit(CarLoadingState());
      var productGetImage = await _repository.getGallery(event.productId);
      var getproductVariant = await _repository.getProductVariant();
      emit(CarRequestSuccessState(productGetImage, getproductVariant,
          getproductCategory, getproductProperties));
    });
  }
}

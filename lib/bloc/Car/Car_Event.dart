import 'package:rizino/data/Model/Car.dart';

abstract class CarEvent {

}
class CarInitEvent extends CarEvent {
  String productId;
  String categoryId;
  CarInitEvent(this.productId, this.categoryId);
}

class CarGetInitData extends CarEvent {
  List<Car> car;
  CarGetInitData(this.car);
}

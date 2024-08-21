import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rizino/bloc/Car/Car_Bloc.dart';
import 'package:rizino/bloc/Car/Car_Event.dart';
import 'package:rizino/bloc/Home/Home_Bloc.dart';
import 'package:rizino/bloc/Home/Home_Event.dart';
import 'package:rizino/data/Model/Car.dart';

class CarListScreen extends StatefulWidget {
  List<Car> carList;
  CarListScreen(this.carList,{super.key});

  @override
  State<CarListScreen> createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  @override
  void initState() {
    BlocProvider.of<CarBloc>(context).add(CarGetInitData(widget.carList));

    super.initState();
  }

  var carList = [
    {'name': 'ایران خودرو', 'image': 'assets/images/1.png'},
    {'name': 'سایپا', 'image': 'assets/images/2.png'},
    {'name': 'کرمان موتور', 'image': 'assets/images/3.png'},
    {'name': 'مدیران خودرو', 'image': 'assets/images/4.png'},
    {'name': 'کیا', 'image': 'assets/images/5.png'},
    {'name': 'آمیکو', 'image': 'assets/images/6.png'},
    {'name': 'هایما', 'image': 'assets/images/7.png'},
    {'name': 'بی ام و', 'image': 'assets/images/8.png'},
    {'name': 'مرسدس بنز', 'image': 'assets/images/9.png'},
    {'name': 'پورشه', 'image': 'assets/images/10.png'},
    {'name': 'سیتروئن', 'image': 'assets/images/11.png'},
    {'name': 'فردا موتورز', 'image': 'assets/images/12.png'},
    {'name': 'فونیکس', 'image': 'assets/images/13.png'},
    {'name': 'دانگ فنگ', 'image': 'assets/images/14.png'},
    {'name': 'بهمن موتورز', 'image': 'assets/images/15.png'},
    {'name': 'هیوندای', 'image': 'assets/images/16.png'},
    {'name': 'رنو', 'image': 'assets/images/17.png'},
    {'name': 'سانگ یانگ', 'image': 'assets/images/18.png'},
    {'name': 'اس دبلیو ام', 'image': 'assets/images/19.png'},
    {'name': 'جک', 'image': 'assets/images/20.png'},
    {'name': 'لاماری', 'image': 'assets/images/21.png'},
    {'name': 'تویوتا', 'image': 'assets/images/22.png'},
    {'name': 'لکسوس', 'image': 'assets/images/23.png'},
    {'name': 'فولکس', 'image': 'assets/images/24.png'},
    {'name': 'میتسوبیشی', 'image': 'assets/images/25.png'},
    {'name': 'دایون', 'image': 'assets/images/26.png'},
    {'name': 'لیفان', 'image': 'assets/images/27.png'},
    {'name': 'فورد', 'image': 'assets/images/28.png'},
    {'name': 'شورلت', 'image': 'assets/images/29.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(left: 44, right: 44, bottom: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //   ),
                      // );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(158, 129, 184, 255),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                color: Colors.black,
                                '${carList[index]['image']}',
                              )),
                          Text('${carList[index]['name']}'),
                        ],
                      ),
                    ),
                  );
                },
                childCount: 4,
              ),
            ),
          )
        ],
      )),
    );
  }
}

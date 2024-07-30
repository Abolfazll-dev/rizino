import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rizino/Constants/colors.dart';
import 'package:rizino/bloc/Home/Home_Bloc.dart';
import 'package:rizino/bloc/Home/Home_Event.dart';
import 'package:rizino/bloc/Home/Home_State.dart';
import 'package:rizino/data/Model/Ads.dart';
import 'package:rizino/data/Model/Arz.dart';
import 'package:rizino/data/Model/Banner.dart';
import 'package:rizino/widgets/Cached_image.dart';

import 'package:persian_number_utility/persian_number_utility.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  var jsonList;
  var jsonListGold;

  @override
  void initState() {
    getData();
    getDataGold();

    BlocProvider.of<HomeBloc>(context).add(HomeGetInitData());
    super.initState();
  }

  void getData() async {
    try {
      var response = await Dio().get(
          'http://nerkh-api.ir/api/55dd7bf36165068ede08dfbf61fb1839/currency');
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data['data']['prices'];
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  void getDataGold() async {
    try {
      var response = await Dio()
          .get('http://nerkh-api.ir/api/55dd7bf36165068ede08dfbf61fb1839/gold');
      if (response.statusCode == 200) {
        setState(() {
          jsonListGold = response.data['data']['prices'];
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return Center(
                  child: loadingIndicator(),
                );
              } else if (state is HomeRequestSuccessState) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      BlocProvider.of<HomeBloc>(context).add(HomeGetInitData());
                    },
                    child: CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 24, 0, 10),
                            child: Text(
                              'ریزینو',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, fontFamily: 'irdb'),
                            ),
                          ),
                        ),
                        ...[
                          state.bannerList.fold(
                            (l) {
                              return const SliverToBoxAdapter();
                            },
                            (r) {
                              return CategoryWidget(r);
                            },
                          ),
                        ],
                        ArzTitleWidget('قیمت ارز ها'),
                        ArzList(jsonList),
                        ...[
                          state.adsList.fold((l) {
                            return const SliverToBoxAdapter();
                          }, (r) {
                            return Ads1(r, 0);
                          })
                        ],
                        ArzTitleWidget('قیمت طلا'),
                        GoldPriceList(jsonListGold),
                        ...[
                          state.adsList.fold((l) {
                            return const SliverToBoxAdapter();
                          }, (r) {
                            return Ads1(r, 1);
                          }),
                        ],
                        ArzTitleWidget('قیمت خودرو ها'),
                        SliverPadding(
                          padding: const EdgeInsets.only(
                              left: 44, right: 44, bottom: 20),
                          sliver: SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200.0,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          158, 129, 184, 255),
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
                                );
                              },
                              childCount: 4,
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 0, bottom: 20, right: 44, left: 44),
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      width: 1, color: CustomColors.blue),
                                  minimumSize: const Size(double.infinity, 50)),
                              child: const Text(
                                'مشاهده بیشتر',
                                style: TextStyle(color: CustomColors.blue),
                              ),
                            ),
                          ),
                        ),
                        ArzTitleWidget('محاسبه هزینه ساخت مسکن'),
                        SliverPadding(padding: EdgeInsets.fromLTRB(44, 0, 44, 35),sliver: SliverToBoxAdapter(
                          child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset('assets/images/hazine.jpg')),
                        ),)
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text('خطایی در دریافت اطلاعات به وجود آمده!'),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  SizedBox loadingIndicator() {
    return const SizedBox(
      width: 34,
      height: 34,
      child: Center(
        child: LoadingIndicator(
            indicatorType: Indicator.ballRotateChase,
            colors: [CustomColors.blue],
            strokeWidth: 2,
            pathBackgroundColor: Colors.black),
      ),
    );
  }
}

// ignore: must_be_immutable
class Ads1 extends StatelessWidget {
  List<Ads> ads;
  int indexNumber;
  Ads1(
    this.ads,
    this.indexNumber, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 44),
        height: 150,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedImge(imageUrl: ads[indexNumber].image)),
      ),
    );
  }
}

// ignore: must_be_immutable
class GoldPriceList extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var goldJson;
  GoldPriceList(
    this.goldJson, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60,
            margin: const EdgeInsets.only(right: 44, left: 44, bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(18, 0, 0, 0),
                    blurRadius: 20,
                  )
                ],
                color: Colors.white),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: SvgPicture.asset(
                    'assets/images/gold.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
                const Text('طلای 18 عیار'),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '${goldJson['geram18']['current']}'
                        .seRagham()
                        .toPersianDigit(),
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('ریالء'),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            margin: const EdgeInsets.only(right: 44, left: 44, bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(18, 0, 0, 0),
                    blurRadius: 20,
                  )
                ],
                color: Colors.white),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: SvgPicture.asset(
                    'assets/images/gold.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
                const Text('طلای 18 عیار'),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '${goldJson['geram18']['current']}'
                        .seRagham()
                        .toPersianDigit(),
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('ریالء'),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            margin: const EdgeInsets.only(right: 44, left: 44, bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(18, 0, 0, 0),
                    blurRadius: 20,
                  )
                ],
                color: Colors.white),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: SvgPicture.asset(
                    'assets/images/gold.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
                const Text('طلای 18 عیار'),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '${goldJson['geram18']['current']}'
                        .seRagham()
                        .toPersianDigit(),
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('ریالء'),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 20, right: 44, left: 44),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1, color: CustomColors.blue),
                  minimumSize: const Size(double.infinity, 50)),
              child: const Text(
                'مشاهده بیشتر',
                style: TextStyle(color: CustomColors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArzList extends StatelessWidget {
  var arzList2;
  ArzList(
    this.arzList2, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  height: 130,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Opacity(
                        opacity: 0.6,
                        child: SizedBox(
                          width: 150,
                          height: 130,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: Image.asset(
                                'assets/images/usa.jpg',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                          child: Text(
                            'دلار آمریکا',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${arzList2['USD']['current']}'
                                  .toPersianDigit()
                                  .seRagham(),
                              style: const TextStyle(shadows: [
                                Shadow(
                                  color: Color.fromARGB(173, 0, 0, 0),
                                  blurRadius: 10,
                                )
                              ], color: CustomColors.backgroundScreenColor),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'ریالء',
                              style: TextStyle(
                                  color: CustomColors.backgroundScreenColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  height: 130,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Opacity(
                        opacity: 0.6,
                        child: SizedBox(
                          width: 150,
                          height: 130,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: Image.asset(
                                'assets/images/eu.jpg',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                          child: Text(
                            'یورو',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${arzList2['EUR']['current']}'
                                  .toPersianDigit()
                                  .seRagham(),
                              style: const TextStyle(
                                  color: CustomColors.backgroundScreenColor),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'ریالء',
                              style: TextStyle(
                                  color: CustomColors.backgroundScreenColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 1, color: CustomColors.blue),
                    minimumSize: const Size(double.infinity, 50)),
                child: const Text(
                  'مشاهده بیشتر',
                  style: TextStyle(color: CustomColors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArzTitleWidget extends StatelessWidget {
  String name;
  ArzTitleWidget(
    this.name, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 30),
        child: Text(
          name,
          style: const TextStyle(fontSize: 17, fontFamily: 'irdb'),
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  List<BannerCampain> banners;
  CategoryWidget(
    this.banners, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(28, 20, 28, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: CustomColors.blue),
                  child: Container(
                    width: 48,
                    height: 48,
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        color: CustomColors.backgroundScreenColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedImge(
                          imageUrl: banners[4].image,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'هزینه ساخت خانه',
                  style: TextStyle(fontSize: 8),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: CustomColors.blue),
                  child: Container(
                    width: 48,
                    height: 48,
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        color: CustomColors.backgroundScreenColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedImge(
                          imageUrl: banners[3].image,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'ارز های دیجیتال',
                  style: TextStyle(fontSize: 9),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: CustomColors.blue),
                  child: Container(
                    width: 48,
                    height: 48,
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        color: CustomColors.backgroundScreenColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedImge(
                          imageUrl: banners[2].image,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'قیمت خودرو',
                  style: TextStyle(fontSize: 9),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: CustomColors.blue),
                  child: Container(
                    width: 48,
                    height: 48,
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        color: CustomColors.backgroundScreenColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedImge(
                          imageUrl: banners[1].image,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'قیمت طلا',
                  style: TextStyle(fontSize: 9),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: CustomColors.blue),
                  child: Container(
                    width: 48,
                    height: 48,
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        color: CustomColors.backgroundScreenColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedImge(
                          imageUrl: banners[0].image,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'قیمت ارز ها',
                  style: TextStyle(fontSize: 9),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

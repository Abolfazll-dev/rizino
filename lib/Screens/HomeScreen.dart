import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rizino/Constants/colors.dart';
import 'package:rizino/bloc/Home/Home_Bloc.dart';
import 'package:rizino/bloc/Home/Home_Event.dart';
import 'package:rizino/bloc/Home/Home_State.dart';
import 'package:rizino/data/Model/Arz.dart';
import 'package:rizino/data/Model/Banner.dart';
import 'package:rizino/widgets/Cached_image.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Arz>? arzList;

  @override
  void initState() {
    getData();
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ریزینو',
        ),
        centerTitle: true,
      ),
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
                          BlocProvider.of<HomeBloc>(context)
                              .add(HomeGetInitData());
                        },
                        child: CustomScrollView(
                          slivers: [
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
                            const ArzTitleWidget(),
                            ...[
                              state.arzList.fold((l) {
                                return SliverToBoxAdapter();
                              }, (r) {
                                return ArzList(r);
                              })
                            ]
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
              ))),
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

class ArzList extends StatelessWidget {
  List<Arz> arzList;
  ArzList(
    this.arzList, {
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
                      Positioned(
                        top: 0,
                        right: 0,
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                          child: Text(
                            'دلار آمریکا',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Text(
                        arzList[0].current,
                        style: TextStyle(
                            color: CustomColors.backgroundScreenColor),
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
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                        child: Text(
                          'یورو',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'مشاهده بیشتر',
                  style: TextStyle(color: CustomColors.blue),
                ),
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 1, color: CustomColors.blue),
                    minimumSize: const Size(double.infinity, 50)),
              ),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}

class ArzTitleWidget extends StatelessWidget {
  const ArzTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 44, vertical: 30),
        child: Text(
          'قیمت ارز ها',
          style: TextStyle(fontSize: 17, fontFamily: 'irdb'),
        ),
      ),
    );
  }
}

Future<List> getData() async {
  var response = await Dio().get(
      'http://nerkh-api.ir/api/55dd7bf36165068ede08dfbf61fb1839/currency/');
  List<Arz> cryptoList = response.data['data']['prices']
      .map<Arz>((jsonMapObject) => Arz.fromMapJson(jsonMapObject))
      .toList();
  return cryptoList;
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

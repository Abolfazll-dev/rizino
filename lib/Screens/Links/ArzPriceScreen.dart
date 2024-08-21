import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:rizino/Constants/colors.dart';
import 'package:rizino/bloc/Home/Home_Bloc.dart';
import 'package:rizino/bloc/Home/Home_Event.dart';
import 'package:rizino/bloc/Home/Home_State.dart';
import 'package:rizino/data/Model/Arz.dart';
import 'package:rizino/widgets/Cached_image.dart';

class ArzPriceScreen extends StatefulWidget {
  const ArzPriceScreen({super.key});

  @override
  State<ArzPriceScreen> createState() => _ArzPriceScreenState();
}

class _ArzPriceScreenState extends State<ArzPriceScreen> {
  var jsonList;

  @override
  void initState() {
    getData();
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
        print(jsonList.length);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  var arzList2 = [
    {'name': 'USD', 'image': 'assets/images/usa.jpg', 'title': 'دلار آمریکا'},
    {'name': 'EUR', 'image': 'assets/images/eu.jpg', 'title': 'یورو'},
  ];
  var arzList = [
    {
      'name': 'GBP',
    },
    {
      'name': 'AED',
    },
    {
      'name': 'TRY',
    },
    {
      'name': 'CNY',
    },
    {
      'name': 'JPY',
    },
    {
      'name': 'CAD',
    },
    {
      'name': 'AUD',
    },
    {
      'name': 'NZD',
    },
    {
      'name': 'CHF',
    },
    {
      'name': 'AFN',
    },
    {
      'name': 'SEK',
    },
    {
      'name': 'DKK',
    },
    {
      'name': 'NOK',
    },
    {
      'name': 'KWD',
    },
    {
      'name': 'SAR',
    },
    {
      'name': 'QAR',
    },
    {
      'name': 'OMR',
    },
    {
      'name': 'IQD',
    },
    {
      'name': 'BHD',
    },
    {
      'name': 'SYP',
    },
    {
      'name': 'INR',
    },
    {
      'name': 'PKR',
    },
    {
      'name': 'SGD',
    },
    {
      'name': 'HKD',
    },
    {
      'name': 'MYR',
    },
    {
      'name': 'THB',
    },
    {
      'name': 'RUB',
    },
    {
      'name': 'AZN',
    },
    {
      'name': 'AMD',
    },
    {
      'name': 'GEL',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundScreenColor,
        title: const Text('قیمت ارز ها'),
        centerTitle: true,
      ),
      body: SafeArea(
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
                        ArzListData(
                            arzList2: arzList2,
                            jsonList: jsonList,
                            arzList: arzList),
                        ...[
                          state.arzList.fold((l) {
                            return SliverToBoxAdapter(
                              child: Text(''),
                            );
                          }, (r) {
                            return ArzListData2(
                                arzList2: arzList2,
                                jsonList: jsonList,
                                arzList: arzList,
                                r);
                          })
                        ]
                      ],
                    )),
              );
            } else {
              return const Center(
                child: Text('خطایی در دریافت اطلاعات به وجود آمده!'),
              );
            }
          },
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

class ArzListData extends StatelessWidget {
  ArzListData({
    super.key,
    required this.arzList2,
    required this.jsonList,
    required this.arzList,
  });

  final List<Map<String, String>> arzList2;
  final dynamic jsonList;
  final List<Map<String, String>> arzList;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 44, right: 44, bottom: 20),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          childAspectRatio: 1.2,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              width: 150,
              height: 130,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
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
                            '${arzList2[index]['image']}',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                      child: Text(
                        '${arzList2[index]['title']}',
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
                          '${jsonList['${arzList2[index]['name']}']['current']}'
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
            );
          },
          childCount: 2,
        ),
      ),
    );
  }
}

class ArzListData2 extends StatelessWidget {
  List<Arz> arzDataList;
  ArzListData2(
    this.arzDataList, {
    super.key,
    required this.arzList2,
    required this.jsonList,
    required this.arzList,
  });

  final List<Map<String, String>> arzList2;
  final dynamic jsonList;
  final List<Map<String, String>> arzList;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 44, right: 44, bottom: 20),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          childAspectRatio: 1.2,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              width: 150,
              height: 130,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
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
                            child: CachedImge(
                              imageUrl: arzDataList[index].image,
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                      child: Text(
                        arzDataList[index].name,
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
                          '${jsonList['${arzList[index]['name']}']['current']}'
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
            );
          },
          childCount: 30,
        ),
      ),
    );
  }
}

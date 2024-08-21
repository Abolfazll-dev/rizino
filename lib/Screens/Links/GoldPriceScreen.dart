import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:rizino/Constants/colors.dart';

class GoldPriceScreen extends StatefulWidget {
  const GoldPriceScreen({super.key});

  @override
  State<GoldPriceScreen> createState() => _GoldPriceScreenState();
}

class _GoldPriceScreenState extends State<GoldPriceScreen> {
  var jsonListGold;
  @override
  void initState() {
    getDataGold();
    super.initState();
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

  var goldList = [
    {'name': 'mesghal', 'title': 'مثقال طلا'},
    {'name': 'geram24', 'title': 'طلای 24 عیار'},
    {'name': 'geram18', 'title': 'طلای 18 عیار'},
    {'name': 'ons', 'title': 'انس طلا'},
    {'name': 'seke_bahar', 'title': 'سکه بهار ازادی'},
    {'name': 'sekee_emami', 'title': 'سکه امای'},
    {'name': 'nim', 'title': 'نیم سکه'},
    {'name': 'rob', 'title': 'ربع سکه'},
    {'name': 'gerami', 'title': 'سکه گرمی'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قیمت طلا و سکه'),
        centerTitle: true,
        backgroundColor: CustomColors.backgroundScreenColor,
      ),
      body: SafeArea(
          child: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 900,
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 60,
                    margin:
                        const EdgeInsets.only(right: 44, left: 44, bottom: 20),
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
                        Text('${goldList[index]['title']}'),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            '${jsonListGold['${goldList[index]['name']}']['current']}'
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
                  itemCount: 9,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

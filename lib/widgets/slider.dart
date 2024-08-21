import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:rizino/Constants/colors.dart';
import 'package:rizino/Screens/HomeScreen.dart';
import 'package:rizino/Screens/Links/ArzPriceScreen.dart';
import 'package:rizino/Screens/Links/GoldPriceScreen.dart';
import 'package:rizino/Screens/test.dart';
import 'package:rizino/bloc/Home/Home_Bloc.dart';

import 'package:url_launcher/url_launcher.dart';

class SliderMenu extends StatefulWidget {
  const SliderMenu({super.key});

  @override
  State<SliderMenu> createState() => _SliderMenuState();
}

class _SliderMenuState extends State<SliderMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 1, 0, 40)),
        child: Padding(
          padding: const EdgeInsets.only(right: 44),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 32, right: 44),
                child: Text(
                  'ریزینو',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => HomeBloc(),
                        child: ArzPriceScreen(),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 230,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.only(top: 40),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SvgPicture.asset(
                          'assets/images/Dollar.svg',
                          color: Colors.black,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          'قیمت ارز ها',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GoldPriceScreen(),
                  ));
                },
                child: Container(
                  width: 230,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SvgPicture.asset(
                          'assets/images/gold.svg',
                          color: Colors.black,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          'قیمت روز طلا',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => TestApp()));
                },
                child: Container(
                  width: 230,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SvgPicture.asset(
                          'assets/images/car.svg',
                          color: Colors.black,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          'قیمت روز خودرو',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  launchUrl(
                      Uri.parse(
                          'https://salinam.com/product-cat/%D9%85%D8%B9%D8%B1%D9%81%DB%8C%20%DA%A9%D8%B4%D9%88%D8%B1%D9%87%D8%A7%DB%8C%20%D8%AE%D8%A7%D8%B1%D8%AC%DB%8C%20%D9%88%20%DA%AF%D8%B1%D8%AF%D8%B4%DA%AF%D8%B1%DB%8C%20%D9%88%20%D8%B2%D9%86%D8%AF%DA%AF%DB%8C%20%D9%88%20%D8%A8%D8%B1%DA%AF%D8%B2%D8%A7%D8%B1%DB%8C%20%DA%A9%D9%86%D8%B3%D8%B1%D8%AA%20%D8%AF%D8%B1%20%DA%A9%D8%B4%D9%88%D8%B1%D9%87%D8%A7%DB%8C%20%D8%AE%D8%A7%D8%B1%D8%AC%DB%8C%20%D9%88%20%D8%A7%D8%B1%D9%88%D9%BE%D8%A7%DB%8C%DB%8C'),
                      mode: LaunchMode.externalApplication);
                },
                child: Container(
                  width: 230,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SvgPicture.asset(
                          'assets/images/home.svg',
                          color: Colors.black,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: SizedBox(
                          width: 140,
                          child: Text(
                            'هزینه ساخت خانه',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 80),
                width: 220,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 62, 175, 255),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: GestureDetector(
                  onTap: () {
                    dialNumber(context: context, phoneNumber: '09122433607');
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SvgPicture.asset(
                          'assets/images/call.svg',
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Text(
                          '3607   243   0912'.toPersianDigit(),
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> dialNumber(
    {required String phoneNumber, required BuildContext context}) async {
  final url = "tel:$phoneNumber";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('خطا');
  }

  return;
}

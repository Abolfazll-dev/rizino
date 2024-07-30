import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rizino/Constants/colors.dart';
import 'package:rizino/Screens/HomeScreen.dart';
import 'package:rizino/Screens/test.dart';


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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  TestApp()));
                },
                child: Container(
                  width: 200,
                  height: 40,
                  margin: const EdgeInsets.only(top: 40),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/ProfileScreen.svg',
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          'درباره ما',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 200, child: Divider()),
              InkWell(
                                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  TestApp()));
                },
                child: Container(
                  width: 200,
                  height: 40,
                  margin: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/note.svg',
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          'سفارش طرح توجیهی',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 200, child: Divider()),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  TestApp()));
                },
                child: Container(
                  width: 200,
                  height: 40,
                  margin: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/note.svg',
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          'سفارش نقشه پلان جانمایی',
                          style: TextStyle(color: Colors.white,fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 200, child: Divider()),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse('https://salinam.com/product-cat/%D9%85%D8%B9%D8%B1%D9%81%DB%8C%20%DA%A9%D8%B4%D9%88%D8%B1%D9%87%D8%A7%DB%8C%20%D8%AE%D8%A7%D8%B1%D8%AC%DB%8C%20%D9%88%20%DA%AF%D8%B1%D8%AF%D8%B4%DA%AF%D8%B1%DB%8C%20%D9%88%20%D8%B2%D9%86%D8%AF%DA%AF%DB%8C%20%D9%88%20%D8%A8%D8%B1%DA%AF%D8%B2%D8%A7%D8%B1%DB%8C%20%DA%A9%D9%86%D8%B3%D8%B1%D8%AA%20%D8%AF%D8%B1%20%DA%A9%D8%B4%D9%88%D8%B1%D9%87%D8%A7%DB%8C%20%D8%AE%D8%A7%D8%B1%D8%AC%DB%8C%20%D9%88%20%D8%A7%D8%B1%D9%88%D9%BE%D8%A7%DB%8C%DB%8C'),
                                  mode: LaunchMode.externalApplication);
                },
                child: Container(
                  width: 200,
                  height: 40,
                  margin: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/note.svg',
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: SizedBox(
                          width: 140,
                          child: Text(
                            'مسافرت ، گردشگری ، کار و \n اشتغال و هزینه زندگی در کشورهای خارجی و اروپایی',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white,fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 200, child: Divider()),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 80),
                width: 220,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 62, 175, 255),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: SvgPicture.asset(
                        'assets/images/call.svg',
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: Text(
                        '09103071134',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

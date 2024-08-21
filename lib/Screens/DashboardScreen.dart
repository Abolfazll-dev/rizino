import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rizino/Constants/colors.dart';
import 'package:rizino/Screens/CalculatorScreen.dart';
import 'package:rizino/Screens/CategoryScreen.dart';
import 'package:rizino/Screens/HomeScreen.dart';
import 'package:rizino/Screens/ProfileScreen.dart';
import 'package:rizino/Screens/test.dart';
import 'package:rizino/bloc/Home/Home_Bloc.dart';
import 'package:rizino/widgets/slider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  int _getIndexNumber = 2;
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  bool isSlide = false;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            scaffoldBackgroundColor: CustomColors.backgroundScreenColor,
            fontFamily: 'irm',
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.blue,
                minimumSize: const Size(342, 58),
              ),
            )),
        debugShowCheckedModeBanner: false,
        home: buttomNav()
        // BlocProvider(
        //   create: ((context) => AuthBloc()),
        //   child: const LoginPage(),
        // ),
        );
  }

  Widget buttomNav() {
    return Scaffold(
      body: IndexedStack(index: _getIndexNumber, children: screenIndex()),
      bottomNavigationBar: AnimatedSize(
        duration: const Duration(milliseconds: 700),
        curve: Curves.fastOutSlowIn,
        child: Container(
          height: (!isSlide) ? 70 : 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: BottomNavigationBar(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                currentIndex: _getIndexNumber,
                onTap: (int index) {
                  setState(() {
                    _getIndexNumber = index;
                  });
                },
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                items: [
                 
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: SvgPicture.asset('assets/images/Bag 2.svg'),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/images/Bag 2.svg',
                              color: CustomColors.blue,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: CustomColors.blue,
                                  borderRadius: BorderRadius.circular(40)),
                            )
                          ],
                        ),
                      ),
                      label: 'پیغام ها'),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: SvgPicture.asset(
                            'assets/images/CategoryScreen.svg'),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/images/CategoryScreen.svg',
                              color: CustomColors.blue,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: CustomColors.blue,
                                  borderRadius: BorderRadius.circular(40)),
                            )
                          ],
                        ),
                      ),
                      label: 'دسته بندی'),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 80),
                        child: SvgPicture.asset('assets/images/homeScreen.svg'),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(right: 80),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/images/homeScreen.svg',
                              color: CustomColors.blue,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: CustomColors.blue,
                                  borderRadius: BorderRadius.circular(40)),
                            )
                          ],
                        ),
                      ),
                      label: 'خانه'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> screenIndex() {
    return [
      
      const Directionality(
        textDirection: TextDirection.rtl,
        child: CalculatorApplication(),
      ),
      Directionality(
        textDirection: TextDirection.rtl,
        child: const CategoryScreen(),
      ),
      Directionality(
        textDirection: TextDirection.rtl,
        child: BlocProvider(
          create: (context) => HomeBloc(),
          child: Stack(
            children: [
              const SliderMenu(),
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(animation.value - 80 * animation.value * pi / 180),
                child: Transform.translate(
                  offset: Offset(animation.value * -250, 0),
                  child: Transform.scale(
                    scale: scaleAnimation.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(animation.value * 40),
                      child: HomeScreen(),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: SafeArea(
                  child: InkWell(
                    onTap: () {
                      if (!isSlide) {
                        _animationController.forward();
                      } else {
                        _animationController.reverse();
                      }
                      setState(() {
                        isSlide = !isSlide;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Center(
                        child: Container(
                          width: 24,
                          height: 24,
                          child: SvgPicture.asset(
                              (isSlide)?'assets/images/cancel.svg':'assets/images/menu.svg',
                              color: Colors.black,
                            )
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}

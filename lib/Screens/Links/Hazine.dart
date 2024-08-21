import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:rizino/Constants/colors.dart';

class Hazine extends StatefulWidget {
  const Hazine({super.key});

  @override
  State<Hazine> createState() => _HazineState();
}

class _HazineState extends State<Hazine> with TickerProviderStateMixin {
  double height = 0;
  double height2 = 0;
  double height3 = 0;
  double height4 = 0;
  double height5 = 0;
  double height6 = 0;
  double height7 = 0;
  bool isSelected = true;
  bool isSelected2 = false;
  bool isSelected3 = true;
  bool isSelected4 = false;
  bool isSelected5 = false;
  bool isSelected6 = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;
  final Duration _duration = const Duration(milliseconds: 370);
  Animation<Alignment>? _animation1;
  Animation<Alignment>? _animation2;
  Animation<Alignment>? _animation3;
  Animation<Alignment>? _animation4;
  Animation<Alignment>? _animation5;
  Animation<Alignment>? _animation6;
  Animation<Alignment>? _animation7;
  AnimationController? _animationController1;
  AnimationController? _animationController2;
  AnimationController? _animationController3;
  AnimationController? _animationController4;
  AnimationController? _animationController5;
  AnimationController? _animationController6;
  AnimationController? _animationController7;

  final _controller1 = TextEditingController(text: '0');
  final _controller2 = TextEditingController(text: '0');
  final _controller3 = TextEditingController(text: '0');
  final _controller4 = TextEditingController(text: '0');
  final _controller5 = TextEditingController(text: '0');
  final _controller6 = TextEditingController(text: '0');
  final _controller7 = TextEditingController(text: '0');
  final _controller8 = TextEditingController(text: '0');

  double some = 0;
  bool isVisibil = false;

  @override
  void initState() {
    super.initState();
    height2 = 250;
    isChecked6 = true;

    _animationController1 =
        AnimationController(vsync: this, duration: _duration);

    _animation1 =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
          parent: _animationController1!,
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceIn),
    );
    _animationController2 =
        AnimationController(vsync: this, duration: _duration);

    _animation2 =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
          parent: _animationController2!,
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceIn),
    );
    _animationController3 =
        AnimationController(vsync: this, duration: _duration);

    _animation3 =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
          parent: _animationController3!,
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceIn),
    );
    _animationController4 =
        AnimationController(vsync: this, duration: _duration);

    _animation4 =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
          parent: _animationController4!,
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceIn),
    );
    _animationController5 =
        AnimationController(vsync: this, duration: _duration);

    _animation5 =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
          parent: _animationController5!,
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceIn),
    );
    _animationController6 =
        AnimationController(vsync: this, duration: _duration);

    _animation6 =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
          parent: _animationController6!,
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceIn),
    );
    _animationController7 =
        AnimationController(vsync: this, duration: _duration);

    _animation7 =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
          parent: _animationController7!,
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceIn),
    );
    _animationController6!.forward();
  }

  @override
  void dispose() {
    _animationController1!.dispose();
    _animationController2!.dispose();
    _animationController3!.dispose();
    _animationController4!.dispose();
    _animationController5!.dispose();
    _animationController6!.dispose();
    _animationController7!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('محاسبه هزینه ساخت مسکن'),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(right: 44),
                      child: Text(
                        'نوع ساختمان را انتخاب کنید',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: 'irdb',
                            fontSize: 12,
                            color: CustomColors.gery),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 44, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (_animationController6!.isCompleted) {
                                _animationController6!.reverse();
                              } else {
                                _animationController6!.forward();
                                _animationController7!.reverse();
                              }
                              setState(() {
                                isChecked6 = !isChecked6;
                                isVisibil = false;
                                isChecked7 = false;
                                isSelected = !isSelected;
                                isSelected2 = false;
                                height = 0;
                                (isChecked6 == true)
                                    ? height2 = 250
                                    : height2 = 0;
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 153,
                                  height: 153,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image.asset(
                                          'assets/images/villa.png')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: SizedBox(
                                    child: AnimatedBuilder(
                                        animation: _animationController6!,
                                        builder: (context, child) {
                                          return Container(
                                            width: 27,
                                            height: 20,
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 6, 0, 6),
                                            decoration: BoxDecoration(
                                              color: isChecked6
                                                  ? CustomColors.blue
                                                  : CustomColors.gery,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(40),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: isChecked6
                                                        ? CustomColors.blue
                                                        : CustomColors
                                                            .backgroundScreenColor,
                                                    blurRadius: 12,
                                                    spreadRadius: -5,
                                                    offset: const Offset(0, 8))
                                              ],
                                            ),
                                            child: Stack(
                                              children: <Widget>[
                                                Align(
                                                  alignment: _animation6!.value,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(2, 0, 2, 0),
                                                    child: Container(
                                                      width: 15,
                                                      height: 15,
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_animationController7!.isCompleted) {
                                _animationController7!.reverse();
                              } else {
                                _animationController7!.forward();
                                _animationController6!.reverse();
                              }
                              setState(() {
                                isChecked7 = !isChecked7;
                                isSelected = false;
                                height2 = 0;
                                isVisibil = false;
                                isChecked6 = false;
                                isSelected2 = !isSelected2;
                                (isChecked7 == true)
                                    ? height = 130
                                    : height = 0;
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 153,
                                  height: 153,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: FittedBox(
                                      fit: BoxFit.cover,
                                      child:
                                          Image.asset('assets/images/ap.png')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: SizedBox(
                                    child: AnimatedBuilder(
                                      animation: _animationController7!,
                                      builder: (context, child) {
                                        return Container(
                                          width: 27,
                                          height: 20,
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 6, 0, 6),
                                          decoration: BoxDecoration(
                                              color: isChecked7
                                                  ? CustomColors.blue
                                                  : CustomColors.gery,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(40),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: isChecked7
                                                        ? CustomColors.blue
                                                        : CustomColors
                                                            .backgroundScreenColor,
                                                    blurRadius: 12,
                                                    spreadRadius: -5,
                                                    offset: const Offset(0, 8))
                                              ]),
                                          child: Stack(
                                            children: <Widget>[
                                              Align(
                                                alignment: _animation7!.value,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          2, 0, 2, 0),
                                                  child: Container(
                                                    width: 15,
                                                    height: 15,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Visibility(
                      visible: true,
                      child: AnimatedSize(
                        duration: const Duration(milliseconds: 600),
                        child: SizedBox(
                          height: height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 44, left: 44),
                                child: Text(
                                  'تعداد کل طبقات را وارد کنید',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontFamily: 'irdb',
                                      fontSize: 12,
                                      color: CustomColors.gery),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 44, vertical: 20),
                                width: double.infinity,
                                height: 65,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 20,
                                          spreadRadius: -20)
                                    ],
                                    borderRadius: BorderRadius.circular(15)),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: SizedBox(
                                          width: 200,
                                          height: 20,
                                          child: TextField(
                                              controller: _controller1,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: const InputDecoration(
                                                  hintText:
                                                      'تعداد کل طبقات را وارد کنید',
                                                  hintStyle: TextStyle(
                                                      color: CustomColors.gery,
                                                      fontFamily: 'irdb',
                                                      fontSize: 14),
                                                  border: InputBorder.none)),
                                        ),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: SvgPicture.asset(
                                            'assets/images/Group 66.svg'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 600),
                      child: SizedBox(
                        height: height2,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected3 = !isSelected3;
                                  isSelected4 = false;
                                  isSelected5 = false;
                                  isSelected6 = false;
                                  isVisibil = false;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                    top: 10, right: 44, left: 44, bottom: 10),
                                height: 40,
                                decoration: BoxDecoration(
                                  color: (isSelected3)
                                      ? CustomColors.blue
                                      : Colors.transparent,
                                  border: Border.all(
                                    width: 2,
                                    color: (isSelected3)
                                        ? CustomColors.blue
                                        : CustomColors.gery,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Text(
                                        'همکف',
                                        style: TextStyle(
                                            color: (isSelected3)
                                                ? Colors.white
                                                : CustomColors.black,
                                            fontFamily: 'irdb',
                                            fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected3 = false;
                                  isSelected4 = !isSelected4;
                                  isSelected5 = false;
                                  isSelected6 = false;
                                  isVisibil = false;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                    top: 10, right: 44, left: 44, bottom: 10),
                                height: 40,
                                decoration: BoxDecoration(
                                  color: (isSelected4)
                                      ? CustomColors.blue
                                      : Colors.transparent,
                                  border: Border.all(
                                    width: 2,
                                    color: CustomColors.gery,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Text(
                                        'دوبلکس',
                                        style: TextStyle(
                                            color: (isSelected4)
                                                ? Colors.white
                                                : CustomColors.black,
                                            fontFamily: 'irm',
                                            fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected3 = false;
                                  isSelected4 = false;
                                  isSelected5 = !isSelected5;
                                  isSelected6 = false;
                                  isVisibil = false;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                    top: 10, right: 44, left: 44, bottom: 10),
                                height: 40,
                                decoration: BoxDecoration(
                                  color: (isSelected5)
                                      ? CustomColors.blue
                                      : Colors.transparent,
                                  border: Border.all(
                                    width: 2,
                                    color: CustomColors.gery,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Text(
                                        'تریبلکس',
                                        style: TextStyle(
                                            color: (isSelected5)
                                                ? Colors.white
                                                : CustomColors.black,
                                            fontFamily: 'irm',
                                            fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected3 = false;
                                  isSelected4 = false;
                                  isSelected5 = false;
                                  isSelected6 = !isSelected6;
                                  isVisibil = false;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                    top: 10, right: 44, left: 44, bottom: 20),
                                height: 40,
                                decoration: BoxDecoration(
                                  color: (isSelected6)
                                      ? CustomColors.blue
                                      : Colors.transparent,
                                  border: Border.all(
                                    width: 2,
                                    color: CustomColors.gery,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Text(
                                        'فورلکس',
                                        style: TextStyle(
                                            color: (isSelected6)
                                                ? Colors.white
                                                : CustomColors.black,
                                            fontFamily: 'irm',
                                            fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(right: 44, left: 44),
                      child: Text(
                        'متراژ محوطه سازی (باغ و باغچه ای که نیاز به کف سازی و گل کاری داشته باشد) را وارد کنید',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: 'irm',
                            fontSize: 12,
                            color: CustomColors.gery),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 44, vertical: 20),
                      width: double.infinity,
                      height: 65,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 20,
                                spreadRadius: -20)
                          ],
                          borderRadius: BorderRadius.circular(15)),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: SizedBox(
                                width: 200,
                                height: 20,
                                child: TextField(
                                    controller: _controller2,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        hintText:
                                            'متراژ مد نظر خود را وارد کنید',
                                        hintStyle: TextStyle(
                                            color: CustomColors.gery,
                                            fontFamily: 'irdb',
                                            fontSize: 14),
                                        border: InputBorder.none)),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SvgPicture.asset(
                                  'assets/images/Group 66.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(right: 44, left: 44),
                      child: Text(
                        'متراژ ساخت ساختمان (متراژ کل طبقات) را وارد کنید',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: 'irdb',
                            fontSize: 12,
                            color: CustomColors.gery),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 44, vertical: 20),
                      width: double.infinity,
                      height: 65,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 20,
                                spreadRadius: -20)
                          ],
                          borderRadius: BorderRadius.circular(15)),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: SizedBox(
                                width: 200,
                                height: 20,
                                child: TextField(
                                    controller: _controller3,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        hintText:
                                            'متراژ مد نظر خود را وارد کنید',
                                        hintStyle: TextStyle(
                                            color: CustomColors.gery,
                                            fontFamily: 'irdb',
                                            fontSize: 14),
                                        border: InputBorder.none)),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SvgPicture.asset(
                                  'assets/images/Group 66.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(right: 44, left: 44),
                      child: Text(
                        'امکانات اضافی',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: 'irdb',
                            fontSize: 12,
                            color: CustomColors.gery),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 44),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_animationController1!.isCompleted) {
                                  _animationController1!.reverse();
                                } else {
                                  _animationController1!.forward();
                                }

                                isChecked1 = !isChecked1;
                                (isChecked1) ? height3 = 130 : height3 = 0;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 10),
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: CustomColors.gery),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Text(
                                      'جکوزی',
                                      style: TextStyle(
                                          fontFamily: 'irm', fontSize: 16),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: SizedBox(
                                      child: AnimatedBuilder(
                                          animation: _animationController1!,
                                          builder: (context, child) {
                                            return Container(
                                              width: 27,
                                              height: 20,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 6, 0, 6),
                                              decoration: BoxDecoration(
                                                  color: isChecked1
                                                      ? CustomColors.blue
                                                      : CustomColors.gery,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(40),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: isChecked1
                                                            ? CustomColors.blue
                                                            : CustomColors
                                                                .backgroundScreenColor,
                                                        blurRadius: 12,
                                                        spreadRadius: -5,
                                                        offset:
                                                            const Offset(0, 8))
                                                  ]),
                                              child: Stack(
                                                children: <Widget>[
                                                  Align(
                                                    alignment:
                                                        _animation1!.value,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(2, 0, 2, 0),
                                                      child: Container(
                                                        width: 15,
                                                        height: 15,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: true,
                            child: AnimatedSize(
                              duration: const Duration(milliseconds: 300),
                              child: SizedBox(
                                height: height3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text(
                                        'متراژ ساخت را وارد کنید',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontFamily: 'irdb',
                                            fontSize: 12,
                                            color: CustomColors.gery),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      width: double.infinity,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 20,
                                                spreadRadius: -20)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: SizedBox(
                                                width: 200,
                                                height: 20,
                                                child: TextField(
                                                    controller: _controller4,
                                                    keyboardType: TextInputType
                                                        .number,
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                'متراژ مد نظر خود را وارد کنید',
                                                            hintStyle: TextStyle(
                                                                color:
                                                                    CustomColors
                                                                        .gery,
                                                                fontFamily:
                                                                    'irdb',
                                                                fontSize: 14),
                                                            border: InputBorder
                                                                .none)),
                                              ),
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: SvgPicture.asset(
                                                  'assets/images/Group 66.svg'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_animationController2!.isCompleted) {
                                  _animationController2!.reverse();
                                } else {
                                  _animationController2!.forward();
                                }

                                isChecked2 = !isChecked2;
                                (isChecked2) ? height4 = 130 : height4 = 0;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 20),
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: CustomColors.gery),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Text(
                                      'استخر استاندارد',
                                      style: TextStyle(
                                          fontFamily: 'irm', fontSize: 16),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: SizedBox(
                                      child: AnimatedBuilder(
                                          animation: _animationController2!,
                                          builder: (context, child) {
                                            return Container(
                                              width: 27,
                                              height: 20,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 6, 0, 6),
                                              decoration: BoxDecoration(
                                                  color: isChecked2
                                                      ? CustomColors.blue
                                                      : CustomColors.gery,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(40),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: isChecked2
                                                            ? CustomColors.blue
                                                            : CustomColors
                                                                .backgroundScreenColor,
                                                        blurRadius: 12,
                                                        spreadRadius: -5,
                                                        offset:
                                                            const Offset(0, 8))
                                                  ]),
                                              child: Stack(
                                                children: <Widget>[
                                                  Align(
                                                    alignment:
                                                        _animation2!.value,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(2, 0, 2, 0),
                                                      child: Container(
                                                        width: 15,
                                                        height: 15,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: true,
                            child: AnimatedSize(
                              duration: const Duration(milliseconds: 300),
                              child: SizedBox(
                                height: height4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text(
                                        'متراژ ساخت را وارد کنید',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontFamily: 'irm',
                                            fontSize: 12,
                                            color: CustomColors.gery),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      width: double.infinity,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 20,
                                                spreadRadius: -20)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: SizedBox(
                                                width: 200,
                                                height: 20,
                                                child: TextField(
                                                    controller: _controller5,
                                                    keyboardType: TextInputType
                                                        .number,
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                'متراژ مد نظر خود را وارد کنید',
                                                            hintStyle: TextStyle(
                                                                color:
                                                                    CustomColors
                                                                        .gery,
                                                                fontFamily:
                                                                    'irdb',
                                                                fontSize: 14),
                                                            border: InputBorder
                                                                .none)),
                                              ),
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: SvgPicture.asset(
                                                  'assets/images/Group 66.svg'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_animationController3!.isCompleted) {
                                  _animationController3!.reverse();
                                } else {
                                  _animationController3!.forward();
                                }

                                isChecked3 = !isChecked3;
                                (isChecked3) ? height5 = 130 : height5 = 0;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 20),
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: CustomColors.gery),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Text(
                                      'سونا',
                                      style: TextStyle(
                                          fontFamily: 'irm', fontSize: 16),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: SizedBox(
                                      child: AnimatedBuilder(
                                          animation: _animationController3!,
                                          builder: (context, child) {
                                            return Container(
                                              width: 27,
                                              height: 20,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 6, 0, 6),
                                              decoration: BoxDecoration(
                                                  color: isChecked3
                                                      ? CustomColors.blue
                                                      : CustomColors.gery,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(40),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: isChecked3
                                                            ? CustomColors.blue
                                                            : CustomColors
                                                                .backgroundScreenColor,
                                                        blurRadius: 12,
                                                        spreadRadius: -5,
                                                        offset:
                                                            const Offset(0, 8))
                                                  ]),
                                              child: Stack(
                                                children: <Widget>[
                                                  Align(
                                                    alignment:
                                                        _animation3!.value,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(2, 0, 2, 0),
                                                      child: Container(
                                                        width: 15,
                                                        height: 15,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: true,
                            child: AnimatedSize(
                              duration: const Duration(milliseconds: 300),
                              child: SizedBox(
                                height: height5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text(
                                        'متراژ ساخت را وارد کنید',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontFamily: 'irdb',
                                            fontSize: 12,
                                            color: CustomColors.gery),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      width: double.infinity,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 20,
                                                spreadRadius: -20)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: SizedBox(
                                                width: 200,
                                                height: 20,
                                                child: TextField(
                                                    controller: _controller6,
                                                    keyboardType: TextInputType
                                                        .number,
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                'متراژ مد نظر خود را وارد کنید',
                                                            hintStyle: TextStyle(
                                                                color:
                                                                    CustomColors
                                                                        .gery,
                                                                fontFamily:
                                                                    'irdb',
                                                                fontSize: 14),
                                                            border: InputBorder
                                                                .none)),
                                              ),
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: SvgPicture.asset(
                                                  'assets/images/Group 66.svg'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_animationController4!.isCompleted) {
                                  _animationController4!.reverse();
                                } else {
                                  _animationController4!.forward();
                                }

                                isChecked4 = !isChecked4;
                                (isChecked4) ? height6 = 130 : height6 = 0;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 20),
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: CustomColors.gery),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Text(
                                      'پارک آبی',
                                      style: TextStyle(
                                          fontFamily: 'irm', fontSize: 16),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: SizedBox(
                                      child: AnimatedBuilder(
                                          animation: _animationController4!,
                                          builder: (context, child) {
                                            return Container(
                                              width: 27,
                                              height: 20,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 6, 0, 6),
                                              decoration: BoxDecoration(
                                                  color: isChecked4
                                                      ? CustomColors.blue
                                                      : CustomColors.gery,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(40),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: isChecked4
                                                            ? CustomColors.blue
                                                            : CustomColors
                                                                .backgroundScreenColor,
                                                        blurRadius: 12,
                                                        spreadRadius: -5,
                                                        offset:
                                                            const Offset(0, 8))
                                                  ]),
                                              child: Stack(
                                                children: <Widget>[
                                                  Align(
                                                    alignment:
                                                        _animation4!.value,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(2, 0, 2, 0),
                                                      child: Container(
                                                        width: 15,
                                                        height: 15,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: true,
                            child: AnimatedSize(
                              duration: const Duration(milliseconds: 300),
                              child: SizedBox(
                                height: height6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text(
                                        'متراژ ساخت را وارد کنید',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontFamily: 'irdb',
                                            fontSize: 12,
                                            color: CustomColors.gery),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      width: double.infinity,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 20,
                                                spreadRadius: -20)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: SizedBox(
                                                width: 200,
                                                height: 20,
                                                child: TextField(
                                                    controller: _controller7,
                                                    keyboardType: TextInputType
                                                        .number,
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                'متراژ مد نظر خود را وارد کنید',
                                                            hintStyle: TextStyle(
                                                                color:
                                                                    CustomColors
                                                                        .gery,
                                                                fontFamily:
                                                                    'irdb',
                                                                fontSize: 14),
                                                            border: InputBorder
                                                                .none)),
                                              ),
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: SvgPicture.asset(
                                                  'assets/images/Group 66.svg'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Text(''),
                          const Text(''),
                          const Text(''),
                          const Text(''),
                          const Text(''),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 15,
                child: ElevatedButton(
                  onPressed: () {
                    if (isSelected == true) {
                      if (isSelected3 == true || isSelected4 == true) {
                        var someVilla1 =
                            double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someVilla1;
                          isVisibil = true;
                        });
                      }
                      if (isSelected5 == true) {
                        var someVilla2 =
                            double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller3.text) * 178000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someVilla2;
                          isVisibil = true;
                        });
                      }
                      if (isSelected6 == true) {
                        var someVilla3 =
                            double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller3.text) * 178000000 +
                                double.parse(_controller3.text) * 185000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someVilla3;
                          isVisibil = true;
                        });
                      }
                    } else if (isSelected2 == true) {
                      if (int.parse(_controller1.text) == 1 ||
                          int.parse(_controller1.text) == 2) {
                        var someAp12 =
                            double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someAp12;
                          isVisibil = true;
                        });
                      }
                      if (int.parse(_controller1.text) == 3 ||
                          int.parse(_controller1.text) == 4) {
                        var someAp12 =
                            double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller3.text) * 178000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someAp12;
                          isVisibil = true;
                        });
                      }
                      if (int.parse(_controller1.text) == 5 ||
                          int.parse(_controller1.text) == 6) {
                        var someAp12 =
                            double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller3.text) * 178000000 +
                                double.parse(_controller3.text) * 197000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someAp12;
                          isVisibil = true;
                        });
                      }
                      if (int.parse(_controller1.text) == 7 ||
                          int.parse(_controller1.text) == 8) {
                        var someAp12 =
                            double.parse(_controller3.text) * 178000000 +
                                double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller3.text) * 197000000 +
                                double.parse(_controller3.text) * 203000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someAp12;
                          isVisibil = true;
                        });
                      }
                      if (int.parse(_controller1.text) == 9 ||
                          int.parse(_controller1.text) == 10) {
                        var someAp12 =
                            double.parse(_controller3.text) * 203000000 +
                                double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller3.text) * 178000000 +
                                double.parse(_controller3.text) * 197000000 +
                                double.parse(_controller3.text) * 203000000 +
                                double.parse(_controller3.text) * 210000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someAp12;
                          isVisibil = true;
                        });
                      }
                      if (int.parse(_controller1.text) == 11 ||
                          int.parse(_controller1.text) == 12) {
                        var someAp12 =
                            double.parse(_controller3.text) * 210000000 +
                                double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller3.text) * 178000000 +
                                double.parse(_controller3.text) * 197000000 +
                                double.parse(_controller3.text) * 203000000 +
                                double.parse(_controller3.text) * 210000000 +
                                double.parse(_controller3.text) * 235000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someAp12;
                          isVisibil = true;
                        });
                      }
                      if (int.parse(_controller1.text) == 13 ||
                          int.parse(_controller1.text) == 14) {
                        var someAp12 =
                            double.parse(_controller3.text) * 235000000 +
                                double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller3.text) * 178000000 +
                                double.parse(_controller3.text) * 197000000 +
                                double.parse(_controller3.text) * 203000000 +
                                double.parse(_controller3.text) * 210000000 +
                                double.parse(_controller3.text) * 235000000 +
                                double.parse(_controller3.text) * 242000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someAp12;
                          isVisibil = true;
                        });
                      }
                      if (int.parse(_controller1.text) == 15 ||
                          int.parse(_controller1.text) == 16) {
                        var someAp12 =
                            double.parse(_controller3.text) * 242000000 +
                                double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller3.text) * 178000000 +
                                double.parse(_controller3.text) * 197000000 +
                                double.parse(_controller3.text) * 203000000 +
                                double.parse(_controller3.text) * 210000000 +
                                double.parse(_controller3.text) * 235000000 +
                                double.parse(_controller3.text) * 242000000 +
                                double.parse(_controller3.text) * 250000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someAp12;
                          isVisibil = true;
                        });
                      }
                      if (int.parse(_controller1.text) == 17 ||
                          int.parse(_controller1.text) == 18) {
                        var someAp12 =
                            double.parse(_controller3.text) * 250000000 +
                                double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller3.text) * 178000000 +
                                double.parse(_controller3.text) * 197000000 +
                                double.parse(_controller3.text) * 203000000 +
                                double.parse(_controller3.text) * 210000000 +
                                double.parse(_controller3.text) * 235000000 +
                                double.parse(_controller3.text) * 242000000 +
                                double.parse(_controller3.text) * 250000000 +
                                double.parse(_controller3.text) * 257000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someAp12;
                          isVisibil = true;
                        });
                      }
                      if (int.parse(_controller1.text) == 19 ||
                          int.parse(_controller1.text) == 20) {
                        var someAp12 =
                            double.parse(_controller3.text) * 257000000 +
                                double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller3.text) * 178000000 +
                                double.parse(_controller3.text) * 197000000 +
                                double.parse(_controller3.text) * 203000000 +
                                double.parse(_controller3.text) * 210000000 +
                                double.parse(_controller3.text) * 235000000 +
                                double.parse(_controller3.text) * 242000000 +
                                double.parse(_controller3.text) * 250000000 +
                                double.parse(_controller3.text) * 257000000 +
                                double.parse(_controller3.text) * 273000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someAp12;
                          isVisibil = true;
                        });
                      }
                      if (int.parse(_controller1.text) == 21 ||
                          int.parse(_controller1.text) == 22) {
                        var someAp12 =
                            double.parse(_controller3.text) * 273000000 +
                                double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller3.text) * 178000000 +
                                double.parse(_controller3.text) * 197000000 +
                                double.parse(_controller3.text) * 203000000 +
                                double.parse(_controller3.text) * 210000000 +
                                double.parse(_controller3.text) * 242000000 +
                                double.parse(_controller3.text) * 235000000 +
                                double.parse(_controller3.text) * 250000000 +
                                double.parse(_controller3.text) * 257000000 +
                                double.parse(_controller3.text) * 273000000 +
                                double.parse(_controller3.text) * 309000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someAp12;
                          isVisibil = true;
                        });
                      }
                      if (int.parse(_controller1.text) == 23) {
                        var someAp12 =
                            double.parse(_controller3.text) * 309000000 +
                                double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller3.text) * 178000000 +
                                double.parse(_controller3.text) * 197000000 +
                                double.parse(_controller3.text) * 203000000 +
                                double.parse(_controller3.text) * 210000000 +
                                double.parse(_controller3.text) * 235000000 +
                                double.parse(_controller3.text) * 242000000 +
                                double.parse(_controller3.text) * 250000000 +
                                double.parse(_controller3.text) * 257000000 +
                                double.parse(_controller3.text) * 273000000 +
                                double.parse(_controller3.text) * 309000000 +
                                double.parse(_controller3.text) * 341000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someAp12;
                          isVisibil = true;
                        });
                      }
                      if (int.parse(_controller1.text) == 24) {
                        var someAp12 =
                            double.parse(_controller3.text) * 341000000 +
                                double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller3.text) * 178000000 +
                                double.parse(_controller3.text) * 197000000 +
                                double.parse(_controller3.text) * 203000000 +
                                double.parse(_controller3.text) * 210000000 +
                                double.parse(_controller3.text) * 235000000 +
                                double.parse(_controller3.text) * 242000000 +
                                double.parse(_controller3.text) * 250000000 +
                                double.parse(_controller3.text) * 257000000 +
                                double.parse(_controller3.text) * 273000000 +
                                double.parse(_controller3.text) * 309000000 +
                                double.parse(_controller3.text) * 341000000 +
                                double.parse(_controller3.text) * 358000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someAp12;
                          isVisibil = true;
                        });
                      }
                      if (int.parse(_controller1.text) == 25) {
                        var someAp12 =
                            double.parse(_controller3.text) * 358000000 +
                                double.parse(_controller3.text) * 160000000 +
                                double.parse(_controller3.text) * 178000000 +
                                double.parse(_controller3.text) * 197000000 +
                                double.parse(_controller3.text) * 203000000 +
                                double.parse(_controller3.text) * 210000000 +
                                double.parse(_controller3.text) * 235000000 +
                                double.parse(_controller3.text) * 242000000 +
                                double.parse(_controller3.text) * 250000000 +
                                double.parse(_controller3.text) * 257000000 +
                                double.parse(_controller3.text) * 273000000 +
                                double.parse(_controller3.text) * 309000000 +
                                double.parse(_controller3.text) * 341000000 +
                                double.parse(_controller3.text) * 358000000 +
                                double.parse(_controller3.text) * 376000000 +
                                double.parse(_controller2.text) * 30000000 +
                                double.parse(_controller4.text) * 80000000 +
                                double.parse(_controller5.text) * 50000000 +
                                double.parse(_controller6.text) * 50000000 +
                                double.parse(_controller7.text) * 60000000;
                        setState(() {
                          some = someAp12;
                          isVisibil = true;
                        });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.blue),
                  child: const Text(
                    'محاسبه',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16),
                  ),
                ),
              ),
              Visibility(
                visible: isVisibil,
                child: Positioned(
                  bottom: 90,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.blue),
                    child: Row(
                      children: [
                        Text(
                          '${removeDecimalZeroFormat(some)}'.seRagham(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'ریالء',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }
}

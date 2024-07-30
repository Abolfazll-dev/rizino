import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rizino/Constants/colors.dart';
import 'package:rizino/Screens/DashboardScreen.dart';
import 'package:rizino/Screens/HomeScreen.dart';
import 'package:rizino/bloc/Home/Home_Bloc.dart';
import 'package:rizino/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await getItInit();

  runApp(const Rizino());
}

class Rizino extends StatelessWidget {
  const Rizino({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'irm',
          scaffoldBackgroundColor: const Color.fromARGB(255, 0, 5, 62),
          appBarTheme: AppBarTheme(color: CustomColors.backgroundScreenColor)),
      debugShowCheckedModeBanner: false,
      home: DashboardScreen()
      // BlocProvider(create: (context)=>HomeBloc(),child: HomeScreen(),)
    );
  }
}

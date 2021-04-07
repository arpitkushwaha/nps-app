import 'package:flutter/material.dart';
import 'package:nps/utilities/constants.dart';
import 'package:nps/views/home/home_screen.dart';
import 'package:nps/views/nav_screen.dart';
import 'package:nps/views/intro_screen.dart';
import 'package:nps/views/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NPS',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        Constant.introScreenRoute: (context) => IntroScreen(),
        Constant.loginScreenRoute: (context) => LoginScreen(),
        Constant.homeScreenRoute: (context) => HomeScreen(),
        Constant.navScreenRoute: (context) => NavScreen(),
      },
    );
  }
}

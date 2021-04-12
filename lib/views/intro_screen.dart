import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nps/views/nav_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 15,
      navigateAfterSeconds: new NavScreen(),
      loadingText: Text(
        "STAY SAFE",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.red, fontSize: 20.0),
      ),
      title: Text(
        'Welcome to \nNOBLE PUBLIC SCHOOL',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
      ),
      image: new Image.asset('assets/images/introBooksImage.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150.0,
      loaderColor: Colors.red,
    );
  }
}



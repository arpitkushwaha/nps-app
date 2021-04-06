import 'package:flutter/material.dart';
import 'package:nps/utilities/commons.dart';
import 'package:nps/utilities/size_config.dart';
import 'package:nps/views/home_screen.dart';
import 'package:nps/views/notifications_screen.dart';
import 'package:nps/views/settings_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int currentIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        HomeScreen(),
        NotificationsScreen(),
        SettingsScreen(),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      currentIndex = index;
      index == 0
          ? Common.appBarTitle = "Noble Public School"
          : index == 1
              ? Common.appBarTitle = "Notifications"
              : Common.appBarTitle = "Settings";
    });
  }

  void bottomTapped(int index) {
    setState(() {
      currentIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 200), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: Common.appBarWithAlertDialog(context),
          body: buildPageView(),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: currentIndex,
            items: Common.bottomBarItemsList(),
            onTap: (index) {
              bottomTapped(index);
            },
          ),
        ),
      ),
    );
  }
}

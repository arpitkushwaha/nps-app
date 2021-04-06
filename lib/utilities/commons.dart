import 'package:flutter/material.dart';
import 'package:nps/utilities/constants.dart';
import 'package:nps/views/nav_screen.dart';
import 'package:nps/views/notifications_screen.dart';
import 'package:nps/views/settings_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Common {

  static String appBarTitle = "Noble Public School";

  static AppBar appBar() {
    return AppBar(
      toolbarHeight: 70,
      centerTitle: true,
      title: InkWell(
        child: Text(
          appBarTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(Constant.primaryColorDark),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(80),
        ),
      ),
      backgroundColor: Colors.white,
      // actions: <Widget>[
      //   PopupMenuButton<String>(
      //     onSelected: (String value) {
      //       switch (value) {
      //         case 'Logout':
      //           break;
      //         case 'Settings':
      //           break;
      //       }
      //     },
      //     itemBuilder: (BuildContext context) {
      //       return {'Logout', 'Settings'}.map((String choice) {
      //         return PopupMenuItem<String>(
      //           value: choice,
      //           child: Text(choice),
      //         );
      //       }).toList();
      //     },
      //   ),
      //],
    );
  }

  static AppBar appBarWithAlertDialog(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      centerTitle: true,
      title: InkWell(
        onTap: () {
          showAlertBox(context, 1);
        },
        child: Text(
          appBarTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(Constant.primaryColorDark),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(80),
        ),
      ),
      backgroundColor: Colors.white,
      // actions: <Widget>[
      //   PopupMenuButton<String>(
      //     onSelected: (String value) {
      //       switch (value) {
      //         case 'Logout':
      //           break;
      //         case 'Settings':
      //           break;
      //       }
      //     },
      //     itemBuilder: (BuildContext context) {
      //       return {'Logout', 'Settings'}.map((String choice) {
      //         return PopupMenuItem<String>(
      //           value: choice,
      //           child: Text(choice),
      //         );
      //       }).toList();
      //     },
      //   ),
      //],
    );
  }

  static AlertDialog showAlertBox(BuildContext context, int index) {
    var alertBox = AlertDialog(
      title: Text(
        'Noble Public School',
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('9414078951'),
            SizedBox(
              height: 2,
            ),
            Text('Rangbari,Kota(Raj.) 324005'),
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext) {
          return alertBox;
        });
  }

  static List<SalomonBottomBarItem> bottomBarItemsList() {
    return [
      SalomonBottomBarItem(
        icon: Icon(Icons.home),
        title: Text(
          'Home',
        ),
        selectedColor: Color(Constant.primaryColor),
      ),
      SalomonBottomBarItem(
        icon: Icon(Icons.notifications),
        title: Text(
          'Notifications',
        ),
        selectedColor: Color(Constant.primaryColor),
      ),
      SalomonBottomBarItem(
        icon: Icon(Icons.settings),
        title: Text(
          'Settings',
        ),
        selectedColor: Color(Constant.primaryColor),
      ),
    ];
  }
}



//BottomNavigationBar

class BottomNavbar extends StatefulWidget {
  int currentIndex;
  BottomNavbar(this.currentIndex);

  @override
  _BottomNavbarState createState() => _BottomNavbarState(currentIndex: currentIndex);
}

class _BottomNavbarState extends State<BottomNavbar> {
    int currentIndex = 0;
   _BottomNavbarState({this.currentIndex});

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
         NavScreen(),
         NotificationsScreen(),
         SettingsScreen(),
       ],
     );
   }

   void pageChanged(int index) {
     setState(() {
       currentIndex = index;
     });
   }

   void bottomTapped(int index) {
     setState(() {
       currentIndex = index;
       pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
     });
   }

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
        currentIndex: currentIndex,
        items: Common.bottomBarItemsList(),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          bottomTapped(index);
          // switch (index) {
          //   case 0:
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(builder: (context) => HomeScreen()),
          //     );
          //     break;
          //   case 1:
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(builder: (context) => NotificationsScreen()),
          //     );
          //     break;
          //   case 2:
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(builder: (context) => SettingsScreen()),
          //     );
          //     break;
          // }
        },
    );
  }
}

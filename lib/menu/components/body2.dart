import 'package:co_sense/menu/components/menu_pic.dart';
import 'package:co_sense/screens/speed_history/speed_history.dart';
import 'package:co_sense/screens/validasi/validasi_screen.dart';
import 'package:flutter/material.dart';
import 'package:co_sense/screens/menu_home/home_screen.dart';

import 'menu.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          MenuPic(),
          SizedBox(height: 10),
          Menu(
            text: "Home",
            icon: "assets/icons/home.svg",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
          Menu(
            text: "Tilt History",
            icon: "assets/icons/gyroscope.svg",
            press: () {},
          ),
          Menu(
            text: "Speed History",
            icon: "assets/icons/speed.svg",
            press: () {
              Navigator.pushNamed(context, SpeedHistory.routeName);
            },
          ),
          Menu(
            text: "Distance History",
            icon: "assets/icons/distance.svg",
            press: () {},
          ),
          Menu(
            text: "GPS History",
            icon: "assets/icons/maps.svg",
            press: () {},
          ),
          Menu(
            text: "Video Recording",
            icon: "assets/icons/play-button.svg",
            press: () {},
          ),
          Menu(
            text: "Log Out",
            icon: "assets/icons/log out.svg",
            press: () {
              Navigator.pushNamed(context, ValidasiScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

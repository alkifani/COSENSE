import 'package:co_sense/menu/components/menu_pic.dart';
import 'package:co_sense/screens/distance_history/current_distance.dart';
import 'package:co_sense/screens/maps/current_gps.dart';
import 'package:co_sense/screens/speed_history/speed_history.dart';
import 'package:co_sense/screens/splash/splash_screen.dart';
import 'package:co_sense/screens/tilt_history/current_tilt.dart';
import 'package:co_sense/screens/video_recording/current_video.dart';
import 'package:flutter/material.dart';
import 'package:co_sense/screens/menu_home/home_screen.dart';

import 'menu.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const MenuPic(),
          const SizedBox(height: 10),
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
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CurrentTiltHistoryDisplay(),
                ),
              );
            },
          ),
          Menu(
            text: "Distance History",
            icon: "assets/icons/distance.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CurrentDistanceHistory(),
                ),
              );
            },
          ),
          Menu(
            text: "GPS History",
            icon: "assets/icons/maps.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CurrentGPSHistoryDisplay(),
                ),
              );
            },
          ),
          Menu(
            text: "Video Recording",
            icon: "assets/icons/play-button.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CurrentVideoPlayer(),
                ),
              );
            },
          ),
          Menu(
            text: "About Us",
            icon: "assets/icons/info_logo.svg",
            press: () {
              Navigator.pushNamed(context, SpeedHistory.routeName);
            },
          ),
          Menu(
            text: "Log Out",
            icon: "assets/icons/log out.svg",
            press: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => LoginScreen(),
              //   ),
              // );
              Navigator.pushNamed(context, SplashScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

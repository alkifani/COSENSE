
import 'package:co_sense/autentikasi/auth_screen.dart';
import 'package:co_sense/screens/distance_history/distance_history.dart';
import 'package:co_sense/screens/maps/gps_history.dart';
import 'package:co_sense/screens/speed_history/speed_history2.dart';
// import 'package:co_sense/screens/tilt_history/tilt_history.dart';
import 'package:flutter/widgets.dart';
import 'package:co_sense/screens/splash/splash_screen.dart';
import 'package:co_sense/screens/validasi/validasi_screen.dart';
import 'package:co_sense/screens/login_success/login_success_screen.dart';
import 'package:co_sense/screens/menu_home/home_screen.dart';
import 'package:co_sense/menu/menu_screen.dart';
import 'package:co_sense/screens/speed_history/speed_history.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  ValidasiScreen.routeName: (context) => ValidasiScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  MenuScreen.routeName: (context) => MenuScreen(),
  SpeedHistory.routeName: (context) => SpeedHistory(),
  SpeedHistory2.routeName: (context) => SpeedHistory2(),
  // DistanceHistory.routeName: (context) => DistanceHistory(),
  // TiltHistory.routeName: (context) => TiltHistory(),
  AuthScreen.routeName: (context) => AuthScreen(),
  GPSHistory.routeName: (context) => GPSHistory(),
};
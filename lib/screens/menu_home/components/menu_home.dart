import 'package:co_sense/screens/distance_history/current_distance.dart';
import 'package:co_sense/screens/distance_history/distance_history.dart';
import 'package:co_sense/screens/maps/current_gps.dart';
import 'package:co_sense/screens/maps/gps_history.dart';
import 'package:co_sense/screens/speed_history/speed_data_history.dart';
import 'package:co_sense/screens/speed_history/speed_history.dart';
//import 'package:co_sense/screens/speed_history/speed_history2.dart';
import 'package:co_sense/screens/tilt_history/components/body.dart';
import 'package:co_sense/screens/tilt_history/components/tilt_data_history.dart';
import 'package:co_sense/screens/tilt_history/tilt_history.dart';
import 'package:co_sense/screens/video_recording/video_play.dart';
import 'package:flutter/material.dart';
import 'package:co_sense/constants.dart';
import 'package:co_sense/my_flutter_app_icons.dart';


// class Categories extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> categories = [
//       {"icon": "assets/icons/Flash Icon.svg", "text": "Video Recording"},
//       {"icon": "assets/icons/Bill Icon.svg", "text": "GPS History"},
//       {"icon": "assets/icons/Game Icon.svg", "text": "Tilt History"},
//       {"icon": "assets/icons/Gift Icon.svg", "text": "Speed History"},
//       {"icon": "assets/icons/Discover.svg", "text": "Distance History"},
//       {"icon": "assets/icons/Discover.svg", "text": "About Us"},
//     ];
//     return Padding(
//       padding: EdgeInsets.all(getProportionateScreenWidth(5)),
//
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: List.generate(
//           categories.length,
//               (index) => CategoryCard(
//             icon: categories[index]["icon"],
//             text: categories[index]["text"],
//             press: () {},
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CategoryCard extends StatelessWidget {
//   const CategoryCard({
//     Key? key,
//     required this.icon,
//     required this.text,
//     required this.press,
//   }) : super(key: key);
//
//   final String? icon, text;
//   final GestureTapCallback press;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: SizedBox(
//         width: getProportionateScreenWidth(55),
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(getProportionateScreenWidth(15)),
//               height: getProportionateScreenWidth(55),
//               width: getProportionateScreenWidth(55),
//               decoration: BoxDecoration(
//                 color: Color(0xFFFFECDF),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: SvgPicture.asset(icon!),
//             ),
//             SizedBox(height: 5),
//             Text(text!, textAlign: TextAlign.center)
//           ],
//         ),
//       ),
//     );
//   }
// }


// class MenuHome extends StatefulWidget {
//   const MenuHome({Key? key}) : super(key: key);
//
//   @override
//   State<MenuHome> createState() => _MenuHomeState();
// }
//
// class _MenuHomeState extends State<MenuHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey,
//         title: const Text("Menu Home"),
//       ),
//       body: GridView.count(
//         padding: const EdgeInsets.all(25),
//         crossAxisCount: 2,
//         children: <Widget>[
//           Card(
//             margin: const EdgeInsets.all(8),
//             child: InkWell(
//               onTap: (){},
//               splashColor: Colors.blue,
//               child: Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: const <Widget>[
//                     Icon(Icons.home, size: 70, color: Colors.blueAccent,),
//                     Text("Home", style: TextStyle(fontSize: 17.0),)
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//}

class MenuHome extends StatefulWidget {
  const MenuHome({Key? key}) : super(key: key);

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800, // set the height to an appropriate value
      width: double.infinity, // set the width to the full width of the screen
      child: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayerWidget(),
                  ),
                );
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(MyFlutterApp.play_button, size: 75, color: cocolor,),
                    Text("Video Recording", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                // Navigator.pushNamed(context, GPSHistoryDisplay.routeName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CurrentGPSHistoryDisplay(),
                  ),
                );
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(MyFlutterApp.maps, size: 75, color: cocolor,),
                    Text("GPS History", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                // Navigator.pushNamed(context, SpeedHistory2.routeName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TiltHistoryDisplay(),
                  ),
                );
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(MyFlutterApp.gyroscope, size: 75, color: cocolor,),
                    Text("Tilt History", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          // Card(
          //   margin: const EdgeInsets.all(8),
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.pushNamed(context, SpeedHistory.routeName);
          //     },
          //     splashColor: Colors.blue,
          //     child: Center(
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: const <Widget>[
          //           Icon(MyFlutterApp.speed, size: 75, color: cocolor,),
          //           Text("Speed History", style: TextStyle(fontSize: 17.0)),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CurrentDistanceHistory(),
                  ),
                );
                // Navigator.pushNamed(context, DistanceHistory.routeName);
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(MyFlutterApp.distance, size: 75, color: cocolor,),
                    Text("Distance History", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                showAboutDialog(
                    context: context,
                    applicationIcon: Icon(MyFlutterApp.cosense_logo),
                    applicationName: 'About Page APP',
                    applicationVersion: 'V.0.5',
                    applicationLegalese: 'Developed by Team 7',
                    children: <Widget>[
                      Text('.......'),
                      Text('...'),
                      Text('...'),
                    ],);
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(MyFlutterApp.info_logo, size: 75, color: cocolor,),
                    Text("About US", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

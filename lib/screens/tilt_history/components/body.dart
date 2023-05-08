// import 'package:co_sense/screens/tilt_history/components/tilt_data_history.dart';
// import 'package:flutter/material.dart';
//
// class HomeData extends StatefulWidget {
//   const HomeData({Key? key}) : super(key: key);
//
//   @override
//   State<HomeData> createState() => _HomeDataState();
// }
//
// class _HomeDataState extends State<HomeData> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 const Text(
//                   "Speed Data History",
//                   style: TextStyle(color: Colors.cyan, fontSize: 30),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 allButton("Insert Data", SpeedHistoryDisplay()),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 allButton("Display Data", SpeedHistoryDisplay()),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget allButton(String text, var pageName) {
//     return ElevatedButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => pageName),
//         );
//       },
//       child: Text(
//         text,
//         style: TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }

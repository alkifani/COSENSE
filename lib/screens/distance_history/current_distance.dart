import 'package:co_sense/my_flutter_app_icons.dart';
import 'package:co_sense/screens/distance_history/distance_history.dart';
import 'package:co_sense/screens/distance_history/graf_distance.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class CurrentDistanceHistory extends StatefulWidget {
  const CurrentDistanceHistory({Key? key}) : super(key: key);

  @override
  State<CurrentDistanceHistory> createState() => _CurrentDistanceHistoryState();
}

class _CurrentDistanceHistoryState extends State<CurrentDistanceHistory> {
  final databaseRef = FirebaseDatabase.instance.reference().child("Status");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // const SizedBox(width: 8),
            const Text(
              'Distance History Data',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(width: 10),
            const Icon(MyFlutterApp.distance, color: Colors.black),
          ],
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: SafeArea(
          child: FirebaseAnimatedList(
            query: databaseRef.orderByChild("Time").limitToLast(1),
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              dynamic value = snapshot.value;
              if (!(value is Map<dynamic, dynamic>)) {
                return const SizedBox();
              }
              Map<dynamic, dynamic>? valueMap = value as Map<dynamic, dynamic>?;
              if (valueMap == null) {
                return const SizedBox();
              }
              String? distance = valueMap['distance']?.toString();
              String? time = valueMap['ultra_datetime'] as String?;
              if (distance == null || time == null) {
                return const SizedBox();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Center(child: Text('Time: $time')),
                  const SizedBox(height: 10),
                  Text('Data Distance: ${double.tryParse(distance)?.toStringAsFixed(4) ?? ''} cm'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, DistanceHistoryDisplay.routeName);
                    },
                    child: const Text("Full Data Distance History"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, GrafDistanceHistory.routeName);
                    },
                    child: const Text("Grafik Data Distance History"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

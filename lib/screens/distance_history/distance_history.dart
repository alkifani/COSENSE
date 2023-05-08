import 'package:co_sense/my_flutter_app_icons.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class DistanceHistoryDisplay extends StatefulWidget {
  const DistanceHistoryDisplay({Key? key}) : super(key: key);

  @override
  State<DistanceHistoryDisplay> createState() => _DistanceHistoryDisplayState();
}

class _DistanceHistoryDisplayState extends State<DistanceHistoryDisplay> {
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
              'Distance Historical Data',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(width: 10),
            const Icon(MyFlutterApp.distance, color: Colors.black),
            const Icon(Icons.history, color: Colors.black),
          ],
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: FirebaseAnimatedList(
          query: databaseRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            var value = snapshot.value as Map<dynamic, dynamic>?;
            if (value == null) {
              return const SizedBox();
            }
            var distance = value['distance'] as String?;
            var time = value['ultra_datetime'] as String?;
            if (distance == null || time == null) {
              return const SizedBox();
            }
            return ListTile(
              title: Text('Date Time: $time'),
              subtitle: Text('Distance: $distance'),
            );
          },
        ),
      ),
    );
  }
}

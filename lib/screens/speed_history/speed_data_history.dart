import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class SpeedHistoryDisplay extends StatefulWidget {
  const SpeedHistoryDisplay({Key? key}) : super(key: key);

  @override
  State<SpeedHistoryDisplay> createState() => _SpeedHistoryDisplayState();
}

class _SpeedHistoryDisplayState extends State<SpeedHistoryDisplay> {
  final databaseRef = FirebaseDatabase.instance.reference().child("Status");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Distance History Data'),
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
            var time = value['time'] as String?;
            return ListTile(
              subtitle: Text(distance ?? ''),
              title: Text(time ?? ''),
            );
          },
        ),
      ),
    );
  }
}

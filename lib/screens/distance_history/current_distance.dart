import 'package:co_sense/my_flutter_app_icons.dart';
import 'package:co_sense/screens/distance_history/distance_history.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CurrentDistanceHistory extends StatefulWidget {
  const CurrentDistanceHistory({Key? key}) : super(key: key);

  @override
  State<CurrentDistanceHistory> createState() =>
      _CurrentDistanceHistoryState();
}

class _CurrentDistanceHistoryState extends State<CurrentDistanceHistory> {
  final databaseRef =
  FirebaseDatabase.instance.reference().child("Status").orderByKey().limitToLast(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
      body: StreamBuilder(
        stream: databaseRef.onValue.map((event) => event.snapshot),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!.value as Map<dynamic, dynamic>?;
            if (data != null) {
              final distance = data['distance'] as String?;
              final time = data['ultra_datetime'] as String?;
              if (distance != null && time != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    Center(child: Text('Time: $time')),
                    const SizedBox(height: 10),
                    Text('Data Distance: $distance'),
                    const SizedBox(height: 10),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, DistanceHistoryDisplay.routeName);
                      },
                      child: const Text("Full Data Distance History"),
                    ),
                  ],
                );
              }
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

import 'package:co_sense/my_flutter_app_icons.dart';
import 'package:co_sense/screens/maps/gps_history.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrentGPSHistoryDisplay extends StatefulWidget {
  const CurrentGPSHistoryDisplay({Key? key}) : super(key: key);

  @override
  State<CurrentGPSHistoryDisplay> createState() => _CurrentGPSHistoryDisplayState();
}

class _CurrentGPSHistoryDisplayState extends State<CurrentGPSHistoryDisplay> {
  final databaseRef = FirebaseDatabase.instance.reference().child("locations");

  Future<void> _openMap(String lat, String long) async {
    String googleURL = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunch(googleURL)
        ? await launch(googleURL)
        : throw 'Could not launch $googleURL';
  }

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
              'GPS Historical Data',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(width: 10),
            const Icon(MyFlutterApp.maps, color: Colors.black),
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
              String? latitude = valueMap['latitude']?.toString();
              String? longitude = valueMap['longitude']?.toString();
              String? time = valueMap['Time'] as String?;
              if (latitude == null || longitude == null || time == null) {
                return const SizedBox();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Center(child: Text('Time: $time')),
                  const SizedBox(height: 10),
                  Text('Data Latitude: ${double.tryParse(latitude)?.toStringAsFixed(8) ?? ''}'),
                  const SizedBox(height: 10),
                  Text('Data Longitude: ${double.tryParse(longitude)?.toStringAsFixed(8) ?? ''}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _openMap(latitude!, longitude!);
                    },
                    child: const Text("Open Google Map"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, GPSHistoryDisplay.routeName);
                    },
                    child: const Text("Full Data GPS History"),
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

import 'package:co_sense/my_flutter_app_icons.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GPSHistoryDisplay extends StatefulWidget {
  static String routeName = "/gps_history";
  const GPSHistoryDisplay({Key? key}) : super(key: key);

  @override
  State<GPSHistoryDisplay> createState() => _GPSHistoryDisplayState();
}

class _GPSHistoryDisplayState extends State<GPSHistoryDisplay> {
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
            dynamic value = snapshot.value;
            if (!(value is Map<dynamic, dynamic>)) {
              return const SizedBox();
            }
            // Map<dynamic, dynamic>? value = snapshot.value as Map<dynamic, dynamic>?;
            // if (value == null) {
            //   return const SizedBox();
            // }
            String? latitude = value['latitude']?.toString();
            String? longitude = value['longitude']?.toString();
            String? time = value['Time'] as String?;
            if (latitude == null || longitude == null || time == null) {
              return const SizedBox();
            }
            return ListTile(
              title: Text('Time: $time'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text('Data Latitude: ${double.tryParse(latitude)?.toStringAsFixed(8) ?? ''}'),
                  const SizedBox(height: 10),
                  Text('Data Longitude: ${double.tryParse(longitude)?.toStringAsFixed(8) ?? ''}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _openMap(latitude, longitude);
                    },
                    child: const Text("Open Google Map"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

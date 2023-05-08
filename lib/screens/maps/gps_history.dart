import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class GPSHistory extends StatefulWidget {
  static String routeName = "/gps_history";

  const GPSHistory({Key? key}) : super(key: key);

  @override
  State<GPSHistory> createState() => _GPSHistoryState();
}

class _GPSHistoryState extends State<GPSHistory> {
  String locationMessage = "Current Location of The User";
  late String lat;
  late String long;

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are denied!");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location permissions are permanently denied, we cannot request"
      );
    }
    return await Geolocator.getCurrentPosition();
  }

  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,

    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {
        locationMessage = 'Latitude: $lat , Longtitude: $long';
      });
    });
  }
  Future<void> _openMap(String lat, String long) async {
    String googleURL = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunch(googleURL)
        ? await launch(googleURL)
        : throw 'Could not launch $googleURL';
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Flutter User Location"),
      centerTitle: true,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(locationMessage, textAlign: TextAlign.center),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _getCurrentLocation().then((value) {
                lat = '${value.latitude}';
                long = '${value.longitude}';
                setState(() {
                  locationMessage = 'latitude: $lat , Longtitude: $long';
                });
                _liveLocation();
              });
            },
            child: const Text("Get Current Location"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _openMap(lat, long);
            },
            child: const Text("Open Google Map"),
          ),
        ],
      ),
    ),
  );

}
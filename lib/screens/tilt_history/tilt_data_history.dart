import 'package:co_sense/my_flutter_app_icons.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class TiltHistoryDisplay extends StatefulWidget {
  static String routeName = "/tilt_history";
  const TiltHistoryDisplay({Key? key}) : super(key: key);

  @override
  State<TiltHistoryDisplay> createState() => _TiltHistoryDisplayState();
}

class _TiltHistoryDisplayState extends State<TiltHistoryDisplay> {
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
              'Full Tilt Historical Data',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(width: 10),
            const Icon(MyFlutterApp.gyroscope, color: Colors.black),
            const Icon(Icons.history, color: Colors.black),
          ],
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: FirebaseAnimatedList(
          query: databaseRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
            var value = snapshot.value as Map<dynamic, dynamic>?;
            if (value == null) {
              return const SizedBox();
            }

            var acceldatax = value['accel_data_x'] as num?;
            var acceldatay = value['accel_data_y'] as num?;
            var acceldataz = value['accel_data_z'] as num?;
            if (acceldatax == null || acceldatay == null || acceldataz == null) {
              return const SizedBox();
            }

            var time = value['gyro_datetime'] as String?;
            var gyrodatax = value['gyro_data_x'] as num?;
            var gyrodatay = value['gyro_data_y'] as num?;
            var gyrodataz = value['gyro_data_z'] as num?;
            if (time == null || gyrodatax == null || gyrodatay == null || gyrodataz == null) {
              return const SizedBox();
            }

            return ListTile(
              title: Text('Gyro Time: $time'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Accel Data:'),
                  Text('X=${acceldatax.toStringAsFixed(5)}'),
                  Text('Y=${acceldatay.toStringAsFixed(5)}'),
                  Text('Z=${acceldataz.toStringAsFixed(5)}'),
                  const SizedBox(height: 8),
                  Text('Gyro Data:'),
                  Text('X=${gyrodatax.toStringAsFixed(5)}'),
                  Text('Y=${gyrodatay.toStringAsFixed(5)}'),
                  Text('Z=${gyrodataz.toStringAsFixed(5)}'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

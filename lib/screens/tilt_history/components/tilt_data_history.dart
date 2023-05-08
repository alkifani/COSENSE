import 'package:co_sense/my_flutter_app_icons.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class TiltHistoryDisplay extends StatefulWidget {
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
              'Tilt Historical Data',
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

            var accel_data_x = value['accel_data_x'] as num?;
            var accel_data_y = value['accel_data_y'] as num?;
            var accel_data_z = value['accel_data_z'] as num?;
            if (accel_data_x == null || accel_data_y == null || accel_data_z == null) {
              return const SizedBox();
            }

            var gyro_time = value['gyro_datetime'] as String?;
            var gyro_data_x = value['gyro_data_x'] as num?;
            var gyro_data_y = value['gyro_data_y'] as num?;
            var gyro_data_z = value['gyro_data_z'] as num?;
            if (gyro_time == null || gyro_data_x == null || gyro_data_y == null || gyro_data_z == null) {
              return const SizedBox();
            }

            return ListTile(
              title: Text('Gyro Time: $gyro_time'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Accel Data:'),
                  Text('X=${accel_data_x.toStringAsFixed(2)}'),
                  Text('Y=${accel_data_y.toStringAsFixed(2)}'),
                  Text('Z=${accel_data_z.toStringAsFixed(2)}'),
                  const SizedBox(height: 8),
                  Text('Gyro Data:'),
                  Text('X=${gyro_data_x.toStringAsFixed(2)}'),
                  Text('Y=${gyro_data_y.toStringAsFixed(2)}'),
                  Text('Z=${gyro_data_z.toStringAsFixed(2)}'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GrafDistanceHistory extends StatefulWidget {
  static const String routeName = '/graf_distance';

  const GrafDistanceHistory({Key? key}) : super(key: key);

  @override
  _GrafDistanceHistoryState createState() => _GrafDistanceHistoryState();
}

class _GrafDistanceHistoryState extends State<GrafDistanceHistory> {
  List<TimeSeriesDistance> _data = [];
  final databaseRef = FirebaseDatabase.instance.reference().child("Status");

  @override
  void initState() {
    super.initState();
    databaseRef.orderByChild("Time").onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<dynamic, dynamic>? values = snapshot.value as Map<dynamic, dynamic>?;
        _data = [];
        values?.forEach((key, value) {
          if (value is Map<dynamic, dynamic>) {
            dynamic distance = value['distance'];
            dynamic time = value['ultra_datetime'];
            if (distance != null && time != null && time.toString().isNotEmpty) {
              try {
                DateTime dateTime = DateTime.parse(time.toString().replaceAll(',', ''));
                _data.add(TimeSeriesDistance(dateTime, double.tryParse(distance.toString()) ?? 0.0));
              } catch (e) {
                print('Failed to parse date: $time. Error: $e');
              }
            }
          }
        });
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Distance Graph'),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                child: charts.TimeSeriesChart(
                  [
                    charts.Series<TimeSeriesDistance, DateTime>(
                      id: 'distance',
                      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                      domainFn: (TimeSeriesDistance distance, _) => distance.time,
                      measureFn: (TimeSeriesDistance distance, _) => distance.distance,
                      data: _data,
                    ),
                  ],
                  animate: true,
                  animationDuration: const Duration(milliseconds: 500),
                  defaultRenderer: charts.LineRendererConfig(includePoints: true),
                  primaryMeasureAxis: charts.NumericAxisSpec(
                    tickProviderSpec: charts.BasicNumericTickProviderSpec(zeroBound: false),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeSeriesDistance {
  final DateTime time;
  final double distance;

  TimeSeriesDistance(this.time, this.distance);
}

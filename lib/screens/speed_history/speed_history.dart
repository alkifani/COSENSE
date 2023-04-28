import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SpeedHistory extends StatefulWidget {
  static String routeName = "/speed_history";

  @override
  State<SpeedHistory> createState() => _SpeedHistoryState();
}

class _SpeedHistoryState extends State<SpeedHistory> {
  @override
  Widget build(BuildContext context) {
    var data = [
      TimeSeriesSpeed(DateTime(2023, 1, 1), 3),
      TimeSeriesSpeed(DateTime(2023, 1, 2), 7),
      TimeSeriesSpeed(DateTime(2023, 1, 3), 2),
      TimeSeriesSpeed(DateTime(2023, 1, 4), 30),
      TimeSeriesSpeed(DateTime(2023, 1, 5), 10),
      TimeSeriesSpeed(DateTime(2023, 1, 7), 5),
    ];

    var seriesList = [
      charts.Series<TimeSeriesSpeed,
          DateTime>(
        id: 'Speed',
        domainFn: (TimeSeriesSpeed speed, _) => speed.time,
        measureFn: (TimeSeriesSpeed speed, _) => speed.speed,
        data: data,
        labelAccessorFn: (TimeSeriesSpeed speed, _) =>
        '${speed.time.day}/${speed.time.month}/${speed.time.year} : ${speed.speed.toString()}',
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Chart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Text(
              "Speed Analysis History",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 450,
              child: TimeSeriesLineAnnotationChart(seriesList, animate: true),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeSeriesSpeed {
  final DateTime time;
  final int speed;

  TimeSeriesSpeed(this.time, this.speed);
}

class TimeSeriesLineAnnotationChart extends StatelessWidget {
  final List<charts.Series<TimeSeriesSpeed, DateTime>> seriesList;
  final bool animate;

  TimeSeriesLineAnnotationChart(this.seriesList, {this.animate = false});

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
    );
  }
}

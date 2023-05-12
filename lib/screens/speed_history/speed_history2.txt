import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SpeedHistory2 extends StatefulWidget {
  static String routeName = "/speed_history2";

  @override
  State<SpeedHistory2> createState() => _SpeedHistory2State();
}

class _SpeedHistory2State extends State<SpeedHistory2> {

  List<List<dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    _loadCSV();
  }

  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/csv/DISTANCE.csv");
    List<List<dynamic>> _listData =
    const CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (_, index) {
          return Card(
            margin: const EdgeInsets.all(3),
            color: index == 0 ? Colors.amber : Colors.white,
            child: Column(
              children: [
                ListTile(
                  leading: Text(_data[index][0].toString()),
                  title: Text(_data[index][1]),
                  subtitle: Text(_data[index][2].toString()),
                  trailing: Text(_data[index][3].toString()),
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                  color: Colors.grey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

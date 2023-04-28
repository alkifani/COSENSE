import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class TiltHistory extends StatefulWidget {
  static String routeName = "/tilt_history";

  const TiltHistory({Key? key}) : super(key: key);

  @override
  State<TiltHistory> createState() => _TiltHistoryState();
}

class _TiltHistoryState extends State<TiltHistory> {
  late DatabaseReference databaseReference;
  List<dynamic> dataList = [];

  @override
  void initState() {
    super.initState();
    // Inisialisasi Firebase
    Firebase.initializeApp().then((value) {
      // Referensi database dengan URL yang diberikan
      databaseReference = FirebaseDatabase.instance.ref().child("Info");
      // Ambil data dari Firebase
      databaseReference.onValue.listen((event) {
        // Dapatkan data snapshot
        var snapshot = event.snapshot;
        // Ubah data snapshot menjadi List<dynamic>
        List<dynamic>? data = snapshot.value as List<dynamic>?;
        // Bersihkan dataList
        dataList.clear();
        // Tambahkan setiap data ke dalam dataList
        data?.forEach((element) {
          dataList.add(element);
        });
        // Update tampilan
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Data From Firebase"),
      ),
      body: DataTable(
        columns: const <DataColumn>[
          DataColumn(label: Text('Accel X')),
          // DataColumn(label: Text('Accel Y')),
          // DataColumn(label: Text('Accel Z')),
          DataColumn(label: Text('Gyro X')),
          DataColumn(label: Text('Gyro Y')),
          DataColumn(label: Text('Gyro Z')),
          DataColumn(label: Text('Temperature')),
          DataColumn(label: Text('Gyro DateTime')),
        ],
        rows: dataList.map((data) => DataRow(
            cells: <DataCell>[
              DataCell(Text('${data['accel_data_x' 'accel_data_y' 'accel_data_z']}')),
              DataCell(Text('${data['gyro_data_x']}')),
              DataCell(Text('${data['gyro_data_y']}')),
              DataCell(Text('${data['gyro_data_z']}')),
              DataCell(Text('${data['temp']}')),
              DataCell(Text('${data['gyro_datetime']}')),
            ]
        )).toList(),
      ),
    );
  }
}

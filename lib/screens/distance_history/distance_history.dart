import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class DistanceHistory extends StatefulWidget {
  static String routeName = "/distance_history";

  const DistanceHistory({Key? key}) : super(key: key);

  @override
  State<DistanceHistory> createState() => _DistanceHistoryState();
}

class _DistanceHistoryState extends State<DistanceHistory> {
  late DatabaseReference databaseReference;
  List<Map<String, dynamic>> dataList = [];

  @override
  void initState() {
    super.initState();
    // Inisialisasi Firebase
    Firebase.initializeApp().then((value) {
      // Referensi database dengan URL yang diberikan
      databaseReference = FirebaseDatabase.instance.ref().child("Status");
      // Ambil data dari Firebase secara real-time
      databaseReference.onValue.listen((event) {
        // Dapatkan data snapshot
        var snapshot = event.snapshot;
        // Konversi snapshot.value menjadi tipe Map<String, dynamic>
        Map<String, dynamic> data = snapshot.value as Map<String, dynamic>? ?? {};
        // Bersihkan dataList
        dataList.clear();
        // Tambahkan data dari snapshot ke dalam dataList
        dataList.addAll(data.entries.map((e) => {'time': e.key, 'distance': e.value}).toList());
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
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('Ultra DateTime')),
            DataColumn(label: Text('Distance')),
          ],
          rows: dataList.map((data) => DataRow(cells: <DataCell>[
            DataCell(Text('${data['time'] ?? ''}')),
            DataCell(Text('${data['distance'] ?? ''}')),
          ])).toList(),
        ),
      ),
    );
  }
}

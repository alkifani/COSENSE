// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class History extends StatefulWidget {
//   @override
//   _HistoryState createState() => _HistoryState();
// }
//
// class _HistoryState extends State<History> {
//   StreamSubscription<Event> _subscriptionTodo;
//   String _todoName = "Display the todo name here";
//
//   @override
//   void initState() {
//     super.initState();
//     initFirebase();
//   }
//
//   @override
//   void dispose() {
//     _subscriptionTodo?.cancel();
//     super.dispose();
//   }
//
//   Future<void> initFirebase() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       final todoStream =
//           FirebaseDatabase.instance.reference().child('Status').child("-NSyyaYnKM70Y-PjDtMc").onValue;
//       _subscriptionTodo = todoStream.listen((event) {
//         var todo = Todo.fromSnapshot(event.snapshot);
//         _updateTodo(todo);
//       });
//     } else {
//       // Handle user not signed in.
//       // For example, show a dialog to prompt user to sign in.
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var itemTile = ListTile(
//       title: Text(_todoName),
//     );
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("App Bar Title"),
//       ),
//       body: ListView(
//         children: <Widget>[
//           itemTile,
//         ],
//       ),
//     );
//   }
//
//   void _updateTodo(Todo value) {
//     setState(() {
//       _todoName = "${value.distance ?? ''} - ${value.time ?? ''}";
//     });
//   }
// }
//
// class Todo {
//   final String key;
//   final String? distance;
//   final String? time;
//
//   Todo({
//     required this.key,
//     required this.distance,
//     required this.time,
//   });
//
//   factory Todo.fromSnapshot(DataSnapshot snapshot) {
//     return Todo(
//       key: snapshot.key!,
//       distance: snapshot.value!["distance"] ?? "",
//       time: snapshot.value!["time"] ?? "",
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, "/halaman_utama");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Text('Welcome To Co-SENSE ${widget.email}!'),
      ),
    );
  }
}
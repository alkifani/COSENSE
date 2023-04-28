import 'package:flutter/material.dart';

import 'components/body.dart';

class ValidasiScreen extends StatelessWidget {
  static String routeName = "/validasi";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Validasi"),
      ),
      body: Body(),
    );
  }
}

import 'package:co_sense/autentikasi/components/home.dart';
import 'package:flutter/material.dart';

import 'package:co_sense/autentikasi/components/body.dart';

class AuthScreen extends StatelessWidget {
  static String routeName = "/AuthScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Autentikasi"),
      ),
      body: Home(email: "example@email.com"),
    );
  }
}

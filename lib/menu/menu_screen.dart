import 'package:flutter/material.dart';

import 'components/body2.dart';

class MenuScreen extends StatefulWidget {
  static String routeName = "/menu";

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("menu"),
      ),
      body: Body(),
    );
  }
}

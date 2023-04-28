import 'package:co_sense/screens/menu_home/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:co_sense/size_config.dart';



class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startlaunching();
  }

  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4,//40%
          fit: BoxFit.cover,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Berhasil Tersambung",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
      ],
    );
  }
  startlaunching()async{
    var duration = const Duration(seconds: 2);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_){
        return new HomeScreen();
      }));
    });
  }
}

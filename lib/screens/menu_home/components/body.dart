import 'package:co_sense/screens/menu_home/components/home_header.dart';
import 'package:co_sense/screens/menu_home/components/menu_home.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(40)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenHeight(25)),
            MenuHome(),
          ],
        ),
      ),
    );
  }
}



// class Body extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(height: getProportionateScreenHeight(40)),
//           //HomeHeader(),
//           MenuHome(),
//           SizedBox(height: getProportionateScreenWidth(25)),
//
//         ],
//       ),
//     ));
//   }
// }

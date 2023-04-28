import 'package:co_sense/menu/menu_screen.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Text("Welcome ! \nTo CO-SENSE APP",
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(15),
              fontWeight: FontWeight.bold,
            ),),
            IconBtnWithCounter(
              svgSrc: "assets/icons/menu.svg",
              press: () {
                Navigator.pushNamed(context, MenuScreen.routeName);
              },
            ),
          ],
      ),
    );

  }
}

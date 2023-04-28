import 'package:flutter/material.dart';

class MenuPic extends StatelessWidget {
  const MenuPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      width: 145,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/splash_1.png"),
          ),
        ],
      ),
    );
  }
}

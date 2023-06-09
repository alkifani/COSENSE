import 'package:co_sense/autentikasi/auth_screen.dart';
import 'package:co_sense/screens/menu_home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:co_sense/constants.dart';
import 'package:co_sense/screens/validasi/validasi_screen.dart';
import 'package:co_sense/size_config.dart';
import 'package:co_sense/autentikasi/components/login.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Selamat datang di Aplikasi Co-Sense, Ayo Hubungkan !",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
      "Kami akan membantu merekontruksi \n Kecelakaan pada Mobil Anda !",
      "image": "assets/images/splash_2.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                            (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        // Navigator.pushNamed(context, HomeScreen.routeName);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      //  press: () {
                      //    Navigator.pushNamed(context, AuthScreen.routeName);
                      //  },
                      // press: () {
                      //   Navigator.pushNamed(context, ValidasiScreen.routeName);
                      // },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? cocolor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

//import 'package:co_sense/autentikasi/auth_screen.dart';
//import 'package:co_sense/autentikasi/components/home.dart';
import 'package:co_sense/autentikasi/components/login.dart';
import 'package:flutter/material.dart';
import 'package:co_sense/screens/login_success/login_success_screen.dart';


import '../../../components/default_button.dart';
import '../../../size_config.dart';

class ValidasiForm extends StatefulWidget {

  @override
  _ValidasiFormState createState() => _ValidasiFormState();
}

class _ValidasiFormState extends State<ValidasiForm> {

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(100)),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "ONLINE",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Bluetooth",
            press: () {
              Navigator.pushNamed(context, LoginSuccessScreen.routeName);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                child: Text(
                  "Cara Penggunaan",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

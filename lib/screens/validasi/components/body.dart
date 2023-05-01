import 'package:co_sense/autentikasi/components/login.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'validasi_form.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Selamat Datang Di Aplikasi CO-SENSE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(20)),
                Text(
                  "Hubungkan Perangkat Anda Dengan  \nMenggunakan USB atau Bluetooth",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                 ValidasiForm(),
                // LoginScreen(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SizedBox(height: getProportionateScreenHeight(20)),
                //NoAccountText(), //bagi tidak ad akun akan dipanggil
              ],
            ),
          ),
        ),
      ),
    );
  }
}

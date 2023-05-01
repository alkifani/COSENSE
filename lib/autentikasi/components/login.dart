import 'package:co_sense/autentikasi/components/create_account.dart';
import 'package:co_sense/autentikasi/components/auth_service.dart';
import 'package:co_sense/autentikasi/components/home.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // SizedBox(height: SizeConfig.screenHeight * 0.04),
            Text(
              "Selamat Datang Di Aplikasi CO-SENSE",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(28),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            Text(
              "Hubungkan Perangkat Anda Dengan  \nMenggunakan USB atau Bluetooth",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            // const SizedBox(
            //   height: 30.0,
            // ),
            SizedBox(height: getProportionateScreenHeight(10)),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            // const SizedBox(
            //   height: 30.0,
            // ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            // const SizedBox(
            //   height: 30.0,
            // ),
            ElevatedButton(
              onPressed: () async {
                final message = await AuthService().login(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                if (message!.contains('Success')) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Home(email: _emailController.text),
                    ),
                  );
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              },
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 30.0,
            ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => const CreateAccount(),
            //       ),
            //     );
            //   },
            //   child: const Text('Create Account'),
            // ),
          ],
        ),
      ),
    );
  }
}

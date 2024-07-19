import 'package:flutter/material.dart';
import 'package:rshttk/screen/home.dart';
import 'package:rshttk/screen/homepage.dart';
import 'package:rshttk/screen/login.dart';
import 'package:rshttk/screen/order_deliver.dart';
import 'package:rshttk/screen/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const Rshttk());
}

class Rshttk extends StatelessWidget {
  const Rshttk({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: sharedPref.getString("id") == null ? "login" : "home",
      routes: {
        "login": (context) => const LoginPage(),
        "signup": (context) => const RegisterPage(),
        "homepage": (context) => const HomePage(),
        "home" :(context) =>  Home(),
        "test": (context) => const Deliver(),
      },
    );
  }
}

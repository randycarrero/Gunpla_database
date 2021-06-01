import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gunpla_database/authscreen/login_screen.dart';
import 'package:gunpla_database/authscreen/sign_up_screen.dart';
import 'package:gunpla_database/home/home_screen.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (auth.currentUser == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      }
    });

    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 80,
        ),
      ),
    );
  }
}

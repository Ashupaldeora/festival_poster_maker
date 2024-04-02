import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
    return Scaffold(
      backgroundColor: Color(0xff1D2539),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/images/logo.webp'),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(
            color: Colors.white,
          )
        ]),
      ),
    );
  }
}

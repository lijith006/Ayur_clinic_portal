import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          //  image
          Image.asset("assets/images/bg_2.png", fit: BoxFit.cover),

          //  logo
          Center(
            child: Image.asset(
              "assets/images/logo_small.png",
              width: 120,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}

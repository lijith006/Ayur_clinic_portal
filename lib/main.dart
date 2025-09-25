import 'package:flutter/material.dart';
import 'package:ayur_clinic_portal/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ayur Clinic Portal',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Roboto'),
      home: const HomeScreen(),
    );
  }
}

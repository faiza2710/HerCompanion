import 'package:flutter/material.dart';
import 'package:fyp/appbar.dart';
import 'package:fyp/bottom_navigation_screen.dart';
import 'screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //appBar : CustomAppBar(),
        body: SplashScreen(),
      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:fyp/appbar.dart';
import 'package:fyp/bottom_navigation_screen.dart';
import 'screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('step1');
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyAhFRBR5F02Pp-0lSrg3BgKsfdPOJDDVGQ',
          appId: '1:498317647563:android:cab902dd2d573e402e454e',
          messagingSenderId: '498317647563',
          projectId: 'projet-fyp'));
  runApp(const MyApp());
  print('firebase get');
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

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fyp/todo_screens/splash.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:permission_handler/permission_handler.dart';
import 'package:fyp/bottom_navigation_screen.dart';

import 'Auth/SignUp.dart';
import 'job/jobs_page.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart'; // <--- Add this

Future<void> requestNotificationPermissions() async {
  var status = await Permission.notification.status;

  if (status.isDenied) {
    await Permission.notification.request();
  } else if (status.isPermanentlyDenied) {
    openAppSettings();
  }
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyAhFRBR5F02Pp-0lSrg3BgKsfdPOJDDVGQ',
      appId: '1:498317647563:android:cab902dd2d573e402e454e',
      messagingSenderId: '498317647563',
      projectId: 'projet-fyp',
    ),
  );

  tz.initializeTimeZones();
  const AndroidInitializationSettings androidSettings =
  AndroidInitializationSettings('@mipmap/logo');
  final InitializationSettings settings =
  InitializationSettings(android: androidSettings);
  await flutterLocalNotificationsPlugin.initialize(settings);
  requestNotificationPermissions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SplashScreen(),
    );
  }
}

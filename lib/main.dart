import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fyp/todo_screens/splash.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:permission_handler/permission_handler.dart';
import 'package:fyp/bottom_navigation_screen.dart';

import 'Auth/SignUp.dart';
import 'job/jobs_page.dart';
Future<void> requestNotificationPermissions() async {
  var status = await Permission.notification.status;

  if (status.isDenied) {
    // If permission is denied, request it
    await Permission.notification.request();
  } else if (status.isPermanentlyDenied) {
    // If permanently denied, direct user to app settings
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: JobListScreen(),
        // body: SignUpPage(),
        // body:phone_call()
        body: BottomNavigationScreen(),
        // body: SplashScreen(), // Change to NewTaskPage
      ),
    );
  }
}


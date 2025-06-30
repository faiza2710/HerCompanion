// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter/material.dart';
//
// class FirebaseMessagingService {
//   final FirebaseMessaging _messaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
//   FirebaseMessagingService(this.flutterLocalNotificationsPlugin);
//
//   Future<void> init() async {
//     // Request permission (especially for iOS)
//     NotificationSettings settings = await _messaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     print('User granted permission: ${settings.authorizationStatus}');
//
//     // Get and print device token (save it to Firestore later)
//     String? token = await _messaging.getToken();
//     print('FCM Token: $token');
//
//     // Handle foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Foreground message received: ${message.notification?.title}');
//
//       // Show local notification for foreground messages
//       _showLocalNotification(message);
//     });
//
//     // Handle notification tap when app is in background or terminated
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('Notification clicked with data: ${message.data}');
//       // TODO: Add navigation logic here to navigate to specific screen
//       // You might need a navigation service or GetX routing
//     });
//   }
//
//   Future<void> _showLocalNotification(RemoteMessage message) async {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;
//
//     if (notification != null && android != null) {
//       final androidDetails = AndroidNotificationDetails(
//         'channel_id',
//         'channel_name',
//         channelDescription: 'channel description',
//         importance: Importance.max,
//         priority: Priority.high,
//         icon: '@mipmap/logo',
//       );
//
//       final notificationDetails = NotificationDetails(android: androidDetails);
//
//       await flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         notificationDetails,
//         payload: message.data['postId'], // pass postId for navigation
//       );
//     }
//   }
// }

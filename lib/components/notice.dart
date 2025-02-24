import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationHelper {
  static final _notification = FlutterLocalNotificationsPlugin();
  static init() {
    _notification.initialize(const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/logo'),
        iOS: DarwinInitializationSettings()));
    tz.initializeTimeZones();
  }

  Future<void> ScheduleNotification(int id,String title, String body, DateTime dateTime) async {
    var androidDetails = AndroidNotificationDetails(
      'important_notification',
      'New channel',
      importance: Importance.max,
      priority: Priority.high,
    );

    var iosDetails = DarwinNotificationDetails();
    var notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // Convert user-provided DateTime to TimeZone-aware DateTime
    final tz.TZDateTime scheduledDate = tz.TZDateTime.from(dateTime, tz.local);

    await _notification.zonedSchedule(
      id,
      title,
      body,
      scheduledDate, // Schedule notification at this exact time
      notificationDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

}

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;

class NotificationHelper {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize the notification plugin
  Future<void> initialize() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('flutter_logo');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  // Schedule a daily notification at 10 PM in Istanbul time
  Future<void> scheduleDailyNotification() async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    final tz.TZDateTime scheduledTime = tz.TZDateTime(
        tz.getLocation('Europe/Istanbul'),
        now.year,
        now.month,
        now.day,
        23,
        10,
        0);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Daily Notification',
      'This is your daily notification',
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_notification_channel_id',
          'Daily Notification Channel',
          channelDescription: 'Daily notification channel',
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          playSound: true,
        ),
      ),
      // androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'daily_notification',
    );
  }
}

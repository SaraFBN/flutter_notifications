import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'noti_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tzdata.initializeTimeZones();
  final notificationHelper = NotificationHelper();
  await notificationHelper.initialize();
  await notificationHelper.scheduleDailyNotification();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Notification App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Daily Notification App'),
        ),
        body: Center(
          child: Text('Your app content goes here'),
        ),
      ),
    );
  }
}

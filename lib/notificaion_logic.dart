// import 'package:flutter/material.dart';

// import 'noti_manager.dart';
// import 'package:timezone/timezone.dart' as tz;

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   void athkarnoti() {
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

//     // Calculate the scheduled time for 9 PM today
//     tz.TZDateTime scheduledDate = tz.TZDateTime(
//       tz.local,
//       now.year,
//       now.month,
//       now.day,
//       21, // 9 PM
//       19, // 0 minutes
//       10, // 0 seconds
//     );

//     // If the scheduled time is in the past, schedule it for 9 PM tomorrow
//     if (now.isAfter(scheduledDate)) {
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }

//     // Schedule the daily notification at 9 PM
//     NotificationManager.scheduleNotificationDaily(
//       title: "Daily Reminder",
//       body: "It's 9 PM! Time to read your athkar.",
//       id: 1,
//       scheduledDate: scheduledDate,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     athkarnoti();
//     return Scaffold(
//       body: Center(
//         child: Text('hello'),
//       ),
//     );
//   }
// }

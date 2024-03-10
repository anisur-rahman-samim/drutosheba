import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationPage extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification with Sound and Vibration',
          style: h2.copyWith(color: Colors.white),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _showNotification();
          },
          child: Text('Show Notification'),
        ),
      ),
    );
  }

  Future<void> _showNotification() async {
    // Initialize the notification plugin
    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/launcher_icon');
    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

   /* // Define the vibration pattern (double vibration)
    final List<int> vibrationPattern = [700, 1400, 700, 1400];
    Int64List? vibrationPatternInt64 = Int64List.fromList(vibrationPattern);

    // Vibrate
    bool? hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator ?? false) {
      Vibration.vibrate(pattern: vibrationPattern);
    }*/

    // Define the notification details
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your channel id3',
      'your channel name2',
      'your channel description2',
      importance: Importance.max,
      priority: Priority.high,
     // sound: RawResourceAndroidNotificationSound('extra_tune'),
     // sound: UriAndroidNotificationSound('android.resource://com.example.druto_sheba_driver/raw/extra_tune'),
     // vibrationPattern: vibrationPatternInt64,
    );
    final NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    // Show the notification
    await flutterLocalNotificationsPlugin.show(
      0,
      'Notification Title',
      'Notification Body',
      platformChannelSpecifics,
      payload: 'item x',
    );
  }
}


import 'dart:typed_data';

import 'package:druto_seba_driver/firebase_options.dart';
import 'package:druto_seba_driver/src/modules/trip/tripRequestPage.dart';
import 'package:druto_seba_driver/src/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:vibration/vibration.dart';
import 'src/app.dart';
import 'src/services/notifications.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupFirebaseMessaging();

  // Initialize the local notification plugin
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/launcher_icon');
  var initializationSettingsIOS = IOSInitializationSettings();
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);


  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));




  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
     Vibration.vibrate(
      pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500],
    );
    await displayLocalNotification(message);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    Get.to(() => TripRequestPage());
    await displayLocalNotification(message);
  });



  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  String? fcmToken = await FirebaseMessaging.instance.getToken();
  print('FCM Token: $fcmToken');
  LocalStorage.saveData(key: "fcm", data: fcmToken);

  runApp(App());
}
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
Future<void> displayLocalNotification(RemoteMessage message) async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    'channel_description',
    playSound: true,
    sound: RawResourceAndroidNotificationSound('notification'),
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
    vibrationPattern: Int64List.fromList([500, 1000, 500, 2000, 500, 3000, 500, 500]),
  );

  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: IOSNotificationDetails()

  );

  await flutterLocalNotificationsPlugin.show(
    0,
    message.notification?.title ?? 'Notification',
    message.notification?.body ?? '',
    platformChannelSpecifics,
    payload: message.data.toString(),
  );
}
void setupFirebaseMessaging() {
  FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
}

Future<void> myBackgroundMessageHandler(RemoteMessage message) async {
  Vibration.vibrate(
    pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500],
  );
  await displayLocalNotification(message);
}





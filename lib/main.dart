import 'package:druto_seba_driver/firebase_options.dart';
import 'package:druto_seba_driver/src/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'src/app.dart';

Future<void> myBackgroundMessageHandler(RemoteMessage message) async {
  // Handle background messages
  print("Background message received: $message");
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // Handle foreground messages
    print('Got a message whilst in the foreground!');
    print('Message bb data: ${message.notification}');
    print('Message bb data: ${message.data}');
    print('Message bb data: ${message.sentTime}');
    print('Message bb data: ${message.category}');
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    // Handle background and terminated messages
    print('A new onMessageOpenedApp event was published!');
    print('Message aa  data: ${message.data}');

  });

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  String? fcmToken = await FirebaseMessaging.instance.getToken();
  print('FCM Token: $fcmToken');
  LocalStorage.saveData(key: "fcm", data: fcmToken);

  runApp(App());
}






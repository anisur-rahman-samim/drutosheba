import 'package:druto_seba_driver/src/pages/welcome/views/maphome.dart';
import 'package:druto_seba_driver/src/pages/welcome/views/welcome_views.dart';
import 'package:druto_seba_driver/src/services/notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'configs/appTheme.dart';
import 'pages/home/bottomBarHome.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
     // home: BottombarHome(),
      //home: WelcomeView(),
      home: NotificationPage(),
    );
  }
}

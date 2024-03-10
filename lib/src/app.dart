import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'configs/appTheme.dart';
import 'modules/dashboard/dashboard.dart';
import 'modules/welcome/views/welcome_views.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
     home: WelcomeView(),
     // home: DashboardView(),
    //  home: NotificationPage(),
    );
  }
}

import 'package:druto_seba_driver/src/modules/auth/views/registerUserInfoPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'configs/appTheme.dart';
import 'modules/dashboard/dashboard.dart';
import 'modules/splash/splash_view.dart';
import 'modules/welcome/views/welcome_views.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
     home: SplashScreen(),
     // home: DashboardView(),
    //  home: NotificationPage(),
     // home: RegisterUserInfoPage(),
    );
  }
}

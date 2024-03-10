import 'dart:async';
import 'package:druto_seba_driver/src/configs/app_images.dart';
import 'package:druto_seba_driver/src/modules/welcome/views/welcome_views.dart';
import 'package:druto_seba_driver/src/services/local_storage.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/appColors.dart';
import '../../configs/app_texts.dart';
import '../dashboard/dashboard.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      return chooseScreen();
    });
    super.initState();
  }
  chooseScreen() {
    debugPrint("token: ${LocalStorage.getData(key: AppTexts.token)}");

    var userId = LocalStorage.getData(key: AppTexts.token);
    if (userId != null) {
      Get.offAll(() => const DashboardView(),transition: Transition.circularReveal);
    } else {
      Get.offAll(() => WelcomeView(),transition: Transition.circularReveal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Image(image: AssetImage(AppImages.logo)),
            Spacer(),
            CustomLoader(color: black,size: 50,),
            SizedBox(height: 46),
          ],
        ),
      ),
    );
  }
}
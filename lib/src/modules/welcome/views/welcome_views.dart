import 'package:druto_seba_driver/src/configs/app_images.dart';
import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/appColors.dart';
import '../../auth/views/loginPage.dart';
import '../../auth/views/registerNumberPage.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                child: Image.asset(
                  AppImages.welcome,
                  scale: 3,
                )),
            SizedBox(height: Get.height / 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
              child: InkWell(
                onTap: ()=> Get.to(() => LoginPage(),transition: Transition.circularReveal),
                child: Container(
                  height: Get.height * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: blue,width: 1),
                    color: white,
                  ),
                  child: ListTile(
                    leading: Image.asset(AppImages.login),
                    title: Text("আপনার কি একাউন্ট আছে?",style: h3,),
                    subtitle: Text("লগইন করুন",style: h2.copyWith(fontSize: 22),),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
              child: InkWell(
                onTap: ()=> Get.to(() => RegisterPage(),transition: Transition.circularReveal),
                child: Container(
                  height: Get.height * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: blue,width: 1),
                    color: white,
                  ),
                  child: ListTile(
                    leading: Image.asset(AppImages.signup),
                    title: Text("আপনার একাউন্ট নাই?",style: h3,),
                    subtitle: Text("নতুন একাউন্ট তৈরি করুন",style: h2.copyWith(fontSize: 22),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

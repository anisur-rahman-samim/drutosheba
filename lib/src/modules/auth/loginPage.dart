import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/configs/app_images.dart';
import 'package:druto_seba_driver/src/modules/dashboard/dashboard.dart';
import 'package:druto_seba_driver/src/widgets/button/outlineButton.dart';
import 'package:druto_seba_driver/src/widgets/button/primaryButton.dart';
import 'package:druto_seba_driver/src/widgets/formField/customFormField.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'forgetPasswordPage.dart';
import 'registerNumberPage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 150,
              width: Get.width,
              color: primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.logoWhite,
                    color: white,
                    scale: 5,
                  ),
                  KText(
                    text: 'Partner',
                    color: white,
                    fontSize: 18,
                  ),
                ],
              ),
            ),
            Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: paddingH20,
                child: Column(
                  children: [
                    sizeH20,
                    KText(
                      text: 'লগইন',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    sizeH10,
                    KText(
                      text:
                          '''আপনার মোবাইল নাম্বার এবং পাসওয়ার্ড দিয়ে লগইন অপশনে ক্লিক করুন। পাসওয়ার্ড ভুলে গিয়ে থাকলে অথবা নতুন পাসওয়ার্ড সেট করতে, 'আপনার পাসওয়ার্ড ভুলে গেছেন?' অপশনে ক্লিক করতে হবে।''',
                      textAlign: TextAlign.center,
                      color: black45,
                      fontSize: 14,

                      // fontWeight: FontWeight.w600,
                    ),
                    sizeH30,
                    customFormField(
                      hintText: 'মোবাইল নাম্বার লিখুন',
                      isNumberField: true,
                    ),
                    sizeH20,
                    customFormField(
                      hintText: 'আপনার পাসওয়ার্ড লিখুন',
                      isPassword: true,
                    ),
                    sizeH20,
                    primaryButton(
                      buttonName: 'লগইন',
                      onTap: () => Get.to(() => DashboardView()),
                    ),
                    sizeH20,
                    GestureDetector(
                      onTap: () => Get.to(() => ForgetPasswordPage()),
                      child: SizedBox(
                        height: 45,
                        width: Get.width,
                        child: Center(
                          child: KText(
                            text: 'আপনার পাসওয়ার্ড ভুলে গেছেন?',
                            // fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 6,
                    ),
                    outlineButton(
                      buttonName: 'রেজিস্টার',
                      fontWeight: FontWeight.normal,
                      onTap: () => Get.to(() => RegisterPage()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

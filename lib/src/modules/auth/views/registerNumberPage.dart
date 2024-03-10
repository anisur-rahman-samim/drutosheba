import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/configs/app_images.dart';
import 'package:druto_seba_driver/src/modules/auth/controller/auth_controller.dart';
import 'package:druto_seba_driver/src/modules/auth/views/otpPage.dart';
import 'package:druto_seba_driver/src/widgets/button/outlineButton.dart';
import 'package:druto_seba_driver/src/widgets/button/primaryButton.dart';
import 'package:druto_seba_driver/src/widgets/formField/formWithCountryCode.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loginPage.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController numberController = TextEditingController();
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Obx(() => Column(
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
                      text: 'মোবাইল নাম্বার লিখুন',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    sizeH10,
                    KText(
                      text:
                      'যাত্রী অংশিদার হিসাবে নিবন্দন করতে আপনার ফোন নম্বর যাচাই করুন',
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: black45,
                    ),
                    sizeH30,
                    formWithCountryCode(
                      hintText: 'মোবাইল নাম্বার লিখুন',
                      numberTextC: numberController,
                    ),
                    sizeH20,
                    authController.isLoading.value == true? primaryButton(
                        child: CustomLoader(color: white,size: 30,), buttonName: '', onTap: () {  }
                    ): primaryButton(
                        buttonName: 'পরবর্তী',
                        onTap: () {
                          authController.otpSend(phone: numberController.text);
                        }
                    ),
                    SizedBox(
                      height: Get.height / 2.45,
                    ),
                    outlineButton(
                        buttonName: 'লগইন',
                        onTap: () {
                          Get.to(() => LoginPage(),transition: Transition.circularReveal);
                        }
                    )
                  ],
                ),
              ),
            ),
          ],
        ),)
      ),
    );
  }
}

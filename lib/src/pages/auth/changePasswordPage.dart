import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/widgets/button/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/appColors.dart';
import '../../widgets/formField/requiredForm.dart';
import '../../widgets/text/kText.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: black),
        title: KText(
          text: 'পাসওয়ার্ড পরিবর্তন করুন',
          fontSize: 20,
        ),
        backgroundColor: white,
      ),
      body: Padding(
        padding: paddingH10V10,
        child: ListView(
          children: [
            sizeH20,
            requiredForm(
              title: 'আপনার পাসওয়ার্ড লিখুন',
              labelText: 'আপনার পাসওয়ার্ড লিখুন',
              requiredText: '*',
            ),
            // sizeH10,
            requiredForm(
              title: 'আপনার পাসওয়ার্ড নিশ্চিত করুন',
              labelText: 'আপনার পাসওয়ার্ড নিশ্চিত করুন',
              requiredText: '*',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10,
        ),
        child: primaryButton(
          buttonName: 'পরিবর্তন',
          height: 45,
          onTap: () => Get.back(),
        ),
      ),
    );
  }
}

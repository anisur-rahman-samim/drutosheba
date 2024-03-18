import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/modules/auth/controller/auth_controller.dart';
import 'package:druto_seba_driver/src/widgets/button/primaryButton.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/appColors.dart';
import '../../../widgets/formField/requiredForm.dart';
import '../../../widgets/text/kText.dart';

class ChangePasswordPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
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
              controller: passwordController,
              title: 'আপনার পাসওয়ার্ড লিখুন',
              labelText: 'আপনার পাসওয়ার্ড লিখুন',
              requiredText: '*',
            ),
            // sizeH10,
            requiredForm(
              controller: rePasswordController,
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
          onTap: (){
            if(passwordController.text == rePasswordController.text){
              authController.passwordChange(password: passwordController.text);
            }else{
              kSnackBar(message: "Password not match", bgColor: Colors.red);
            }

          },
        ),
      ),
    );
  }
}

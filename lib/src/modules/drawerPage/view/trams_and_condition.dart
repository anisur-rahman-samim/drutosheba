import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/modules/drawerPage/controller/help_controller.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TramsAndCondition extends StatelessWidget {
   TramsAndCondition({super.key});
  final HelpController helpController = Get.put(HelpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'ট্রামস এন্ড কন্ডিশন',
          fontSize: 20,
          color: white,
        ),
      ),
      body: Obx(() => helpController.isLoading.value == true? CustomLoader(color: black, size: 30) :  Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomCardWidget(radius: 10, child: Text(helpController.terms.value)),
      ),)
    );
  }
}

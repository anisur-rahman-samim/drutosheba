import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentTypePage extends StatelessWidget {
  const PaymentTypePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: paddingH10V10,
        child: ListView(
          children: [
            sizeH10,
            KText(
              text: 'রিচার্জ মাধ্যম নির্বাচন করুন',
              fontSize: 22,
            ),
            sizeH20,
            CustomCardWidget(
              radius: 10,
              borderColor: greyBackgroundColor,
              height: 50,
              isPaddingHide: true,
              child: Row(
                children: [
                  sizeW10,
                  Image.asset(
                    'assets/img/Nagad.webp',
                    // width: 80,
                    // scale: 3,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: grey,
                    ),
                  ),
                ],
              ),
            ),
            sizeH10,
            CustomCardWidget(
              radius: 10,
              borderColor: greyBackgroundColor,
              height: 50,
              isPaddingHide: true,
              child: Row(
                children: [
                  sizeW10,
                  Image.asset(
                    'assets/img/otherCard.webp',
                    width: Get.width / 1.8,
                    // scale: 3,
                  ),
                  Spacer(),
                  KText(
                    text: 'এবং অন্যান্য',
                    fontSize: 14,
                    color: grey,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dotted_border/dotted_border.dart';
import 'package:druto_seba_driver/src/widgets/button/primaryButton.dart';
import 'package:druto_seba_driver/src/widgets/formField/dropDownForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/text/kText.dart';

class TikaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'কোভিড-১৯ টিকা',
          fontSize: 20,
          color: white,
        ),
      ),
      body: Padding(
        padding: paddingH20,
        child: ListView(
          children: [
            sizeH20,
            roundedRectBorderWidget(
              height: 150,
            ),
            sizeH10,
            Center(
              child: KText(
                text: 'আপনার টিকা কার্ডের ছবি আপলোড করুন',
                color: black45,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            sizeH30,
            dropDownForm(
              onTap: () {},
              title: 'প্রথম ডোজ তারিখ',
              hintText: 'প্রথম ডোজ তারিখ',
              requiredText: '',
            ),
            sizeH20,
            dropDownForm(
              onTap: () {},
              title: 'দ্বিতীয় ডোজ তারিখ',
              hintText: 'দ্বিতীয় ডোজ তারিখ',
              requiredText: '',
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: paddingH20V20,
        child: primaryButton(
          buttonName: 'আবেদন',
          onTap: () {},
        ),
      ),
    );
  }

  Widget roundedRectBorderWidget({double? height}) {
    return DottedBorder(
      borderType: BorderType.RRect,
      color: grey.shade300,
      dashPattern: [5, 3],
      radius: Radius.circular(10),
      // padding: EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        child: Container(
          height: height,
          width: Get.width,
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: paddingH10V10,
            child: Icon(
              Icons.add_a_photo_outlined,
              size: 50,
              color: grey.shade400,
            ),
          ),
        ),
      ),
    );
  }
}

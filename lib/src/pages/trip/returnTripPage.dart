import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/widgets/formField/customFormField.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/appUtils.dart';
import '../../widgets/card/customCardWidget.dart';
import 'returnTripHistoryPage.dart';

class ReturnTripPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'রিটার্ন ট্রিপ',
          color: white,
          fontSize: 18,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: CustomCardWidget(
              onTap: () => Get.to(() => ReturnTripHistoryPage()),
              radius: 30,
              color: greyBackgroundColor,
              isPaddingHide: true,
              child: Row(
                children: [
                  sizeW10,
                  Icon(
                    Icons.access_time_filled_outlined,
                    size: 20,
                    color: black,
                  ),
                  sizeW5,
                  KText(
                    text: 'সকল ট্রিপ',
                    fontSize: 14,
                  ),
                  sizeW10,
                ],
              ),
            ),
          ),
          sizeW10,
        ],
      ),
      backgroundColor: greyBackgroundColor,
      body: ListView(
        children: [
          CustomCardWidget(
            radius: 0,
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizeH10,
                KText(
                  text: 'আপনার লোকেশন ও গন্তব্য প্ৰদান করুন',
                  fontSize: 14,
                  color: black54,
                ),
                sizeH20,
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: 15,
                          ),
                          sizeH5,
                          Container(
                            height: 50,
                            width: .5,
                            color: grey,
                          ),
                          sizeH5,
                          Icon(
                            Icons.location_pin,
                            size: 15,
                          ),
                        ],
                      ),
                      sizeW20,
                      Expanded(
                        child: Column(
                          children: [
                            customFormField(
                              height: 45,
                              isFilled: true,
                              hintText: 'পিকআপ',
                              hintTextSize: 12,
                              isHintText: true,
                              filledColor: greyBackgroundColor,
                              isHideBorder: true,
                            ),
                            sizeH10,
                            customFormField(
                              height: 45,
                              isFilled: true,
                              hintText: 'গন্তব্য',
                              hintTextSize: 12,
                              isHintText: true,
                              filledColor: greyBackgroundColor,
                              isHideBorder: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                sizeH10,
              ],
            ),
          ),
          sizeH10,
          CustomCardWidget(
            radius: 0,
            elevation: 0,
            child: Column(
              children: [
                _button(
                  onTap: () {},
                  title: 'তারিখ সিলেক্ট করুন',
                  icon: Icons.calendar_month,
                ),
                Divider(),
                _button(
                  onTap: () {},
                  title: 'সময় সিলেক্ট করুন',
                  icon: Icons.access_time_outlined,
                ),
                Divider(),
                _button(
                  onTap: () {},
                  title: 'গাড়ি সিলেক্ট করুন',
                  icon: Icons.local_taxi_outlined,
                ),
              ],
            ),
          ),
          sizeH10,
          CustomCardWidget(
            radius: 0,
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KText(
                  text: 'ভাড়া ডিমান্ড করুন',
                  fontSize: 14,
                ),
                sizeH10,
                customFormField(
                  height: 45,
                  isFilled: true,
                  hintText: 'আপনার ডিমান্ডকৃত ভাড়া',
                  hintTextSize: 14,
                  isHintText: true,
                  filledColor: greyBackgroundColor,
                  isHideBorder: true,
                  contentPadding: paddingH10,
                ),
                sizeH20,
                CustomCardWidget(
                  radius: 30,
                  color: primaryColor,
                  elevation: 0,
                  width: Get.width,
                  child: Center(
                    child: KText(
                      text: 'ট্রিপ পাবলিশ করুন',
                      fontSize: 14,
                      color: white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _button({
    required void Function() onTap,
    required String? title,
    required IconData? icon,
  }) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(5),
      child: Padding(
        padding: paddingH10V10,
        child: Row(
          children: [
            Icon(
              icon,
            ),
            sizeW20,
            KText(
              text: title,
            ),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_down,
              color: grey,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:druto_seba_driver/src/widgets/bottomSheet/customBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/card/customCardWidget.dart';
import '../../widgets/dottedDivider/dotDivider.dart';
import '../../widgets/text/kText.dart';

class TripDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'ট্রিপ এর বিস্তারিত',
          fontSize: 18,
          color: white,
        ),
      ),
      backgroundColor: greyBackgroundColor,
      bottomSheet: Container(
        height: 65,
        width: Get.width,
        color: white,
        child: Padding(
          padding: paddingV10,
          child: Row(
            children: [
              sizeW20,
              Expanded(
                child: CustomCardWidget(
                  onTap: () {
                    customBottomSheet(
                      context: context,
                      height: Get.height / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: KText(
                              text: 'অন্য পার্টনারদের বিড',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(),
                          KText(
                            text: 'যেভাবে কাজ করে',
                            fontWeight: FontWeight.w600,
                          ),
                          sizeH5,
                          KText(
                            text:
                                'নির্দিষ্ট পরিমানে চার্জ প্রদান করে অন্য পার্টনারদের বিড এবং এর বিস্তারিত দেখতে পাবেন',
                            fontSize: 14,
                          ),
                          sizeH20,
                          CustomCardWidget(
                            radius: 5,
                            color: greyBackgroundColor,
                            elevation: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    KText(
                                      text: '5 ৳',
                                      fontWeight: FontWeight.bold,
                                    ),
                                    sizeW10,
                                    KText(
                                      text: 'প্রতিবার দেখার জন্য',
                                      fontSize: 14,
                                    ),
                                  ],
                                ),
                                KText(
                                  text:
                                      '*প্রতিবার বিড দেখার জন্য আলাদা চার্জ প্রযোজ্য',
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ),
                          sizeH20,
                          Row(
                            children: [
                              Expanded(
                                child: CustomCardWidget(
                                  onTap: () => Get.back(),
                                  radius: 30,
                                  borderColor: grey,
                                  elevation: 0,
                                  child: Center(
                                    child: KText(
                                      text: 'না, ধন্যবাদ',
                                      color: primaryColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              sizeW20,
                              Expanded(
                                child: CustomCardWidget(
                                  onTap: () {},
                                  radius: 30,
                                  color: primaryColor,
                                  elevation: 0,
                                  child: Center(
                                    child: KText(
                                      text: 'নিশ্চিত করুন এবং বিড দেখুন',
                                      color: white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          sizeH20,
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'কনফার্ম করার মাধ্যমে আপনি আমাদের',
                                  style: TextStyle(
                                    color: grey,
                                  ),
                                ),
                                TextSpan(
                                  onEnter: (_) {
                                    print('object');
                                  },
                                  text: ' সকল শর্তের ',
                                  style: TextStyle(
                                    color: blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(
                                  text: 'ব্যাপারে সম্মত হচ্ছেন',
                                  style: TextStyle(
                                    color: grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  radius: 30,
                  borderColor: grey,
                  elevation: 0,
                  child: Center(
                    child: KText(
                      text: 'সকল বিড দেখুন',
                      color: primaryColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              sizeW20,
              Expanded(
                child: CustomCardWidget(
                  onTap: () {},
                  radius: 30,
                  color: primaryColor,
                  elevation: 0,
                  child: Center(
                    child: KText(
                      text: 'সকল বিড দেখুন',
                      color: white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              sizeW20,
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          sizeH10,
          CustomCardWidget(
            color: white,
            radius: 0,
            elevation: 0,
            child: Padding(
              padding: paddingV10,
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomCardWidget(
                        radius: 30,
                        color: black,
                        height: 40,
                        elevation: 0,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/img/car5.png',
                              width: 30,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                            sizeW5,
                            KText(
                              text: 'Mini Microbus | 7 Seats',
                              fontSize: 13,
                              color: white,
                            ),
                          ],
                        ),
                      ),
                      // sizeW10,
                      Spacer(),
                      KText(
                        text: 'ট্রিপ DS873344444444EF',
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  sizeH10,
                  DotDividerWidget(
                    fillRate: .5,
                  ),
                  sizeH10,
                  SizedBox(
                    height: 110,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            sizeH5,
                            CircleAvatar(
                              radius: 6,
                              backgroundColor: primaryColor,
                            ),
                            sizeH5,
                            Container(
                              height: 50,
                              width: .7,
                              color: grey,
                            ),
                            sizeH5,
                            Container(
                              color: blue,
                              padding: EdgeInsets.all(7),
                            ),
                            // CircleAvatar(
                            //   radius: 6,
                            //   backgroundColor: primaryColor,
                            // ),
                          ],
                        ),
                        sizeW10,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                KText(
                                  text: 'পিকআপ লোকেশন: ',
                                  color: black54,
                                  fontSize: 14,
                                ),
                                // sizeW5,
                                Container(
                                  width: Get.width / 1.3,
                                  child: KText(
                                    text: 'Panthapath,ঢাকা,বাংলাদেশ',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            SizedBox(
                              width: Get.width / 1.15,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: .2,
                                      color: grey,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: grey,
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: white,
                                      child: Icon(
                                        Icons.location_on,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                KText(
                                  text: 'ড্রপ লোকেশন: ',
                                  color: black54,
                                  fontSize: 14,
                                ),
                                // sizeW5,
                                Container(
                                  width: Get.width / 1.3,
                                  // color: primaryColor,
                                  child: KText(
                                    text:
                                        'Balipara Bridge,Balipara Bridge,বাংলাদেশ',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          sizeH10,
          CustomCardWidget(
            radius: 0,
            elevation: 0,
            child: Padding(
              padding: paddingV10,
              child: Column(
                children: [
                  rawText(
                    title: 'ট্রিপের সময়',
                    content: '02 Jun 2022, 12:59 PM',
                  ),
                  sizeH5,
                  Divider(),
                  sizeH5,
                  rawText(
                    title: 'যাওয়া-আসা',
                    content: 'হাঁ',
                  ),
                  sizeH5,
                  Divider(),
                  sizeH5,
                  rawText(
                    title: 'ফিরতি তারিখ',
                    content: '03 Jun 2022, 12:59 PM',
                  ),
                ],
              ),
            ),
          ),
          sizeH10,
          CustomCardWidget(
            radius: 0,
            elevation: 0,
            height: 70,
            isPaddingHide: true,
            child: Padding(
              padding: paddingV10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  sizeW20,
                  columnText(
                    title: 'এয়ার কন্ডিশনার',
                    content: 'যেকোনো',
                    isReplaceObject: true,
                  ),
                  sizeW10,
                  Container(
                    color: grey,
                    height: 60,
                    width: .5,
                  ),
                  sizeW10,
                  columnText(
                    title: 'সম্ভাব্য সময়',
                    content: '1 ঘ. 40 মি. ',
                    isReplaceObject: true,
                  ),
                  Container(
                    color: grey,
                    height: 60,
                    width: .5,
                  ),
                  sizeW10,
                  columnText(
                    title: 'সম্ভাব্য দুরুত্ব',
                    content: '47.2 কিঃমিঃ',
                    isReplaceObject: true,
                  ),
                  sizeW20,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  rawText({
    required title,
    required content,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KText(
            text: title == null ? '' : '$title:',
            fontSize: 14,
            // color: black45,
          ),
          // title == null ? sizeH10 : sizeW10,
          Spacer(),
          KText(
            text: content,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ],
      );

  columnText({
    required title,
    required content,
    bool? isReplaceObject = false,
  }) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          KText(
            text: isReplaceObject == true ? title : title + ':' ?? '',
            fontSize: 14,
            // color: black45,
          ),
          sizeH5,
          KText(
            text: content,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ],
      );
}

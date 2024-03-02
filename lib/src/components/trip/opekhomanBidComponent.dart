
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/button/outlineButton.dart';
import '../../widgets/card/customCardWidget.dart';
import '../../widgets/dottedDivider/dotDivider.dart';
import '../../widgets/text/kText.dart';

class OpekhomanBidComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingH10,
      child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: 4,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: CustomCardWidget(
                color: white,
                radius: 10,
                child: Padding(
                  padding: paddingH20V10,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          KText(
                            text: 'ট্রিপ: ',
                            color: black54,
                          ),
                          KText(
                            text: 'JR1653890179ZF',
                            fontWeight: FontWeight.bold,
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: black,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  child: KText(
                                    text: 'MicroBus',
                                    fontSize: 14,
                                    color: white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 3),
                              KText(
                                text: '11 Seats',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                      sizeH10,
                      DotDividerWidget(
                        fillRate: .5,
                      ),
                      sizeH10,
                      SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 60,
                              child: Image.asset(
                                'assets/img/car5.png',
                                height: 60,
                                width: 60,
                              ),
                            ),
                            sizeW20,
                            Column(
                              children: [
                                sizeH5,
                                CircleAvatar(
                                  radius: 6,
                                  backgroundColor: black,
                                  child: CircleAvatar(
                                    backgroundColor: white,
                                    radius: 5,
                                  ),
                                ),
                                sizeH5,
                                Container(
                                  height: 50,
                                  width: .7,
                                  color: grey,
                                ),
                                sizeH5,
                                CircleAvatar(
                                  radius: 6,
                                  backgroundColor: primaryColor,
                                ),
                              ],
                            ),
                            sizeW10,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    KText(
                                      text: 'শুরু: ',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    // sizeW5,
                                    Container(
                                      width: Get.width / 2.2,
                                      child: KText(
                                        text: 'Panthapath,ঢাকা,বাংলাদেশ',
                                        fontSize: 14,
                                        maxLines: 2,
                                        color: black54,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    KText(
                                      text: 'শেষ: ',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    // sizeW5,
                                    Container(
                                      width: Get.width / 2.2,
                                      // color: primaryColor,
                                      child: KText(
                                        text:
                                            'Balipara Bridge,Balipara Bridge,বাংলাদেশ',
                                        fontSize: 14,
                                        maxLines: 2,
                                        color: black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      sizeH20,
                      outlineButton(
                        buttonName: 'ম্যাপ দেখুন',
                        textColor: black,
                        outlineColor: grey.shade300,
                        radius: 5,
                        height: 35,
                        width: 120,
                        fontSize: 14,
                        onTap: () {},
                      ),
                      sizeH10,
                      DotDividerWidget(
                        fillRate: .5,
                      ),
                      sizeH10,
                      rawText(
                        title: 'যাত্রার সময়',
                        content: '02 Jun 2022 12:59 PM',
                      ),
                      sizeH5,
                      rawText(
                        title: 'ফিরতি তারিখ',
                        content: '03 Jun 2022 12:59 PM',
                      ),
                      sizeH5,
                      rawText(
                        title: 'রাউন্ড ট্রিপ',
                        content: 'হ্যাঁ',
                      ),
                      sizeH5,
                      rawText(
                        title: 'দুরুত্ব',
                        content: '50.44 কি:মি',
                      ),
                      sizeH5,
                      rawText(
                        title: 'এয়ার কন্ডিশন',
                        content: 'Any',
                      ),
                      sizeH5,
                      Row(
                        children: [
                          rawText(
                            title: null,
                            content: '166 মিনিট আছে',
                          ),
                          Spacer(),
                          outlineButton(
                            buttonName: 'Pending',
                            textColor: white,
                            backgroundColor: primaryColor,
                            outlineColor: primaryColor,
                            radius: 5,
                            height: 35,
                            width: 80,
                            fontSize: 14,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),
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
            color: black45,
          ),
          title == null ? sizeH10 : sizeW10,
          KText(
            text: content,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ],
      );
}

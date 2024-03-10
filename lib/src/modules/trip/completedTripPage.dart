import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/dottedDivider/dotDivider.dart';

class CompletedTripPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'কমপ্লেটেড ট্রিপ',
          color: white,
          fontSize: 18,
        ),
      ),
      backgroundColor: greyBackgroundColor,
      body: Padding(
        padding: paddingH10,
        child: ListView(
          children: [
            sizeH10,
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 3,
                itemBuilder: (c, i) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomCardWidget(
                      color: white,
                      radius: 10,
                      elevation: 0,
                      borderColor: grey.shade200,
                      child: Padding(
                        padding: paddingV10,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 115,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                        width: Get.width / 1.23,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                            sizeH20,
                            DotDividerWidget(
                              fillRate: .5,
                            ),
                            sizeH20,
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
                            sizeH5,
                            Divider(),
                            sizeH5,
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: primaryColor,
                                  radius: 15,
                                  child: Icon(
                                    Icons.local_taxi_rounded,
                                    color: white,
                                    size: 17,
                                  ),
                                ),
                                sizeW10,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    KText(
                                      text: 'Axio-2010',
                                      fontWeight: FontWeight.w600,
                                    ),
                                    KText(
                                      text: 'Dhaka-Metro-H-20-1605',
                                      fontSize: 14,
                                      color: grey,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    KText(
                                      text: 'ভাড়া',
                                      fontSize: 14,
                                      color: grey,
                                    ),
                                    KText(
                                      text: '207 TK',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            sizeH10,
          ],
        ),
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
          ),
          Spacer(),
          KText(
            text: content,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ],
      );
}

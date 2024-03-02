import 'package:druto_seba_driver/src/pages/trip/tripDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/card/customCardWidget.dart';
import '../../widgets/dottedDivider/dotDivider.dart';
import '../../widgets/text/kText.dart';

class TripRequestComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingH10,
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: 4,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () => Get.to(() => TripDetailsPage()),
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: CustomCardWidget(
                color: white,
                radius: 10,
                child: Padding(
                  padding: paddingH10V10,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomCardWidget(
                            radius: 30,
                            color: black,
                            height: 40,
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
                          CustomCardWidget(
                            radius: 30,
                            borderColor: greyBackgroundColor,
                            isPaddingHide: true,
                            elevation: 0,
                            height: 40,
                            borderWidth: 2,
                            child: Row(
                              children: [
                                sizeW10,
                                Icon(
                                  Icons.access_time_filled_outlined,
                                  size: 20,
                                  color: primaryColor,
                                ),
                                sizeW5,
                                KText(
                                  text: '180 মি.',
                                  color: primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                sizeW10,
                              ],
                            ),
                          ),
                        ],
                      ),
                      sizeH10,
                      DotDividerWidget(
                        fillRate: .5,
                      ),
                      sizeH10,
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
                                  width: Get.width / 1.3,
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
                      sizeH10,
                      DotDividerWidget(
                        fillRate: .5,
                      ),
                      sizeH10,
                      rawText(
                        title: 'ট্রিপের সময়',
                        content: '02 Jun 2022 12:59 PM',
                      ),
                      Divider(),
                      rawText(
                        title: 'ফিরতি তারিখ',
                        content: '03 Jun 2022 12:59 PM',
                      ),
                      sizeH5,
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
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
}

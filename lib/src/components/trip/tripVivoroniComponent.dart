
import 'package:druto_seba_driver/src/modules/trip/controller/waiting_bid_trip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/button/outlineButton.dart';
import '../../widgets/card/customCardWidget.dart';
import '../../widgets/dottedDivider/dotDivider.dart';
import '../../widgets/text/kText.dart';

class TripVivoroniComponent extends StatelessWidget {
  final WaitingTripController waitingTripController = Get.put(WaitingTripController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60),
      child: Padding(
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
                              text: 'N/A',
                              fontWeight: FontWeight.bold,
                            ),
                            Spacer(),
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
                                  text: waitingTripController.waitingTripList[index].getBrand?.name,
                                  fontSize: 14,
                                  color: white,
                                ),
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
                          height: 90,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: primaryColor50,
                                child: Icon(
                                  Ionicons.car,
                                  color: primaryColor,
                                  size: 15,
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
                                  // sizeH5,
                                  Expanded(
                                    child: Container(
                                      // height: 50,
                                      width: .7,
                                      color: grey,
                                    ),
                                  ),
                                  sizeH5,
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: CircleAvatar(
                                      radius: 6,
                                      backgroundColor: primaryColor,
                                    ),
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
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
                            KText(
                              text: 'ঢাকা-মেট্রো-চ-05-4213',
                              fontSize: 14,
                            ),
                            Spacer(),
                            KText(
                              text: 'রেন্টাল ভাড়া ৳ 501',
                              fontSize: 14,
                            ),
                          ],
                        ),
                        sizeH10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            outlineButton(
                              buttonName: 'CONFIRMED',
                              textColor: white,
                              backgroundColor: HexColor('#842a8f'),
                              outlineColor: HexColor('#842a8f'),
                              radius: 5,
                              height: 30,
                              width: 90,
                              fontSize: 14,
                              onTap: () {},
                            ),
                            outlineButton(
                              buttonName: 'কোড: 9031',
                              textColor: black,
                              backgroundColor: grey.shade200,
                              outlineColor: grey.shade200,
                              radius: 5,
                              height: 30,
                              width: 90,
                              fontSize: 14,
                              onTap: () {},
                            ),
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: black54,
                              child: CircleAvatar(
                                radius: 11,
                                backgroundColor: white,
                                child: Icon(
                                  Ionicons.person_add_outline,
                                  color: black45,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })),
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

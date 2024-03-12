import 'package:druto_seba_driver/src/widgets/dottedDivider/dotDivider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/appColors.dart';
import '../../../../configs/appUtils.dart';
import '../../../../widgets/card/customCardWidget.dart';
import '../../../../widgets/text/kText.dart';
import 'fares_details_view.dart';

class FaresView extends StatelessWidget {
  const FaresView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'ফেয়ার',
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      size: 15,
                                    ),
                                    sizeW10,
                                    KText(
                                      text: 'Panthapath,ঢাকা,বাংলাদেশ',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 15,
                                ),
                                sizeW10,
                                KText(
                                  text:
                                  'Balipara Bridge,Balipara Bridge,বাংলাদেশ',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  maxLines: 2,
                                ),
                              ],
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
                                    KText(
                                      text: 'ফেয়ার ভাড়া: 157 TK',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: CustomCardWidget(
                                onTap: () => Get.to(() => FaresDetailsView(),transition: Transition.circularReveal),
                                radius: 30,
                                color: greyBackgroundColor,
                                isPaddingHide: true,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      sizeW10,
                                      Icon(
                                        Icons.car_rental_sharp,
                                        size: 20,
                                        color: black,
                                      ),
                                      sizeW5,
                                      KText(
                                        text: 'ডিটেলস',
                                        fontSize: 14,
                                      ),
                                      sizeW10,
                                    ],
                                  ),
                                ),
                              ),
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

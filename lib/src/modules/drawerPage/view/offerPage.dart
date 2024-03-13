import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/appColors.dart';
import '../../../configs/appUtils.dart';
import '../../../widgets/bottomSheet/customBottomSheet.dart';
import '../../../widgets/card/customCardWidget.dart';
import '../../../widgets/text/kText.dart';

class OfferPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'অফার',
          fontSize: 20,
          color: white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () => customBottomSheet(
                context: context,
                height: Get.width / .8,
                child: Container(
                  height: Get.width / .9,
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/img/carBanner.jpg',
                              fit: BoxFit.cover,
                              width: Get.width,
                            ),
                          ),
                          sizeH10,
                          Padding(
                            padding: paddingH20,
                            child: KText(
                              text:
                                  'Lorem Ipsum Dolor sumit.Lorem Ipsum Dolor sumit.',
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          sizeH10,
                          Padding(
                            padding: paddingH20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: 20,
                                      color: Colors.black26,
                                    ),
                                    KText(
                                      text: ' 11:00 PM, 31 May 2022',
                                      color: black54,
                                      fontSize: 14,
                                    ),
                                  ],
                                ),
                                sizeH10,
                                Padding(
                                  padding: paddingH20,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.expand_circle_down_sharp,
                                        size: 20,
                                        color: Colors.black26,
                                      ),
                                      KText(
                                        text: ' 11:00 PM, 1 June 2023',
                                        color: black54,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          sizeH20,
                          Padding(
                            padding: paddingH20,
                            child: Center(
                              child: KText(
                                text: 'Lorem : Ipsum....',
                              ),
                            ),
                          ),
                          sizeH10,
                          Padding(
                            padding: paddingH20,
                            child: Center(
                              child: KText(
                                text: '1. Lorem Ipsum Dolor Sumit.',
                              ),
                            ),
                          ),
                          sizeH10,
                          Padding(
                            padding: paddingH20,
                            child: Center(
                              child: KText(
                                text: '2. Lorem Ipsum Dolor Sumit.',
                              ),
                            ),
                          ),
                          sizeH10,
                          Padding(
                            padding: paddingH20,
                            child: Center(
                              child: KText(
                                text: '3. Lorem Ipsum Dolor Sumit.',
                              ),
                            ),
                          ),
                          sizeH10,
                          Padding(
                            padding: paddingH20,
                            child: Center(
                              child: KText(
                                text: '4. Lorem Ipsum Dolor Sumit.',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              child: CustomCardWidget(
                radius: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/img/carBanner.jpg',
                        fit: BoxFit.cover,
                        height: 150,
                        width: Get.width,
                      ),
                    ),
                    sizeH10,
                    Padding(
                      padding: paddingH20,
                      child: KText(
                        text:
                            'Lorem Ipsum Dolor sumit.Lorem Ipsum Dolor sumit.',
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: paddingH20,
                      child: KText(
                        text:
                            'Lorem : Lorem Ipsum Dolor sumit.Lorem Ipsum Dolor sumit.Lorem Ipsum Dolor sumit.Lorem Ipsum Dolor sumit.....',
                        color: black45,
                        fontSize: 14,
                      ),
                    ),
                    sizeH10,
                    Padding(
                      padding: paddingH20,
                      child: Row(
                        children: [
                          Icon(
                            Icons.timer,
                            size: 20,
                            color: Colors.black26,
                          ),
                          KText(
                            text: ' 11:00 PM, 31 May 2023',
                            color: black54,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                    sizeH10,
                    Padding(
                      padding: paddingH20,
                      child: Row(
                        children: [
                          Icon(
                            Icons.expand_circle_down_sharp,
                            size: 20,
                            color: Colors.black26,
                          ),
                          KText(
                            text: ' 11:00 PM, 1 June 2023',
                            color: black54,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                    sizeH20,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

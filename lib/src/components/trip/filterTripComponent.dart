import 'package:druto_seba_driver/src/dummyData/rentalData.dart';
import 'package:druto_seba_driver/src/widgets/bottomSheet/customBottomSheet.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/card/customCardWidget.dart';

class FilterComponent extends StatefulWidget {
  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      height: 50,
      radius: 0,
      child: Container(
        color: white,
        alignment: Alignment.center,
        child: Row(
          children: [
            Spacer(),
            GestureDetector(
              onTap: () => _all(context),
              child: Container(
                height: 50,
                width: 60,
                // color: primaryColor,
                child: Row(
                  children: [
                    KText(
                      text: 'All ',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    Icon(
                      Icons.filter_list,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
            sizeW5,
            GestureDetector(
              onTap: () => _allVehicles(context),
              child: Container(
                height: 50,
                width: 120,
                // color: primaryColor,
                child: Row(
                  children: [
                    KText(
                      text: 'All Vehicles ',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    Icon(
                      Ionicons.car,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _allVehicles(BuildContext context) {
    return customBottomSheet(
      context: context,
      height: Get.height / 2,
      child: Container(
        height: Get.height / 2.3,
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            Center(
              child: KText(
                text: 'গাড়ির ধরণ দ্বারা ফিল্টার',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizeH20,
            // Divider(),
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: rentalData.length,
                itemBuilder: (c, i) {
                  final item = rentalData[i];
                  return InkWell(
                    onTap: () => Get.back(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: KText(
                            text:
                                '${item.title} ( ${item.description})'.replaceAll(
                              'capacity',
                              '',
                            ),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  _all(BuildContext context) {
    return customBottomSheet(
      context: context,
      height: Get.height / 2,
      child: Container(
        height: Get.height / 2.3,
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            Center(
              child: KText(
                text: 'বিভাগ দ্বারা ফিল্টার',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizeH20,
            // Divider(),
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: vivagList.length,
                itemBuilder: (c, i) {
                  final item = vivagList[i];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
                      InkWell(
                        onTap: () => Get.back(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: KText(
                            text: '${item.vivagName}',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

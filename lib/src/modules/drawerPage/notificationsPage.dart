import 'package:druto_seba_driver/src/services/notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/card/customCardWidget.dart';
import '../../widgets/text/kText.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'নোটিফিকেশন',
          fontSize: 20,
          color: white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => NotificationPage());
            },
            icon: Icon(
              Icons.delete,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: paddingH20V20,
        child: ListView(
          children: [
            CustomCardWidget(
              radius: 10,
              // height: 100,
              width: Get.width,
              child: Padding(
                padding: paddingH10V10,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                          child: Icon(
                            Icons.notifications,
                            size: 30,
                          ),
                        ),
                        sizeW10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              KText(
                                text: 'সঠিক প্রাইস বিড করুন!',
                                fontWeight: FontWeight.bold,
                              ),
                              sizeH5,
                              KText(
                                text:
                                    'বেশি বেশি ট্রিপ নিশ্চিত করতে অবশই ন্যায্যমূল্য বিড করুন',
                                fontSize: 14,
                                textAlign: TextAlign.justify,
                                // maxLines: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: KText(
                        text: '31 May 2022, 09:15 AM',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: black45,
                        maxLines: 10,
                      ),
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
}

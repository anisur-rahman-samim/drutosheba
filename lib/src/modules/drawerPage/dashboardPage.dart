import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../configs/appColors.dart';
import '../../widgets/text/kText.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: black,
        ),
        backgroundColor: white,
        title: KText(
          text: 'ড্যাশবোর্ড',
          fontSize: 18,
          color: black,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: paddingH10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.tune,
                        size: 15,
                        color: black,
                      ),
                      sizeW5,
                      KText(
                        text: 'ফিল্টার',
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          sizeW20,
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Container(
            color: grey.shade100,
            child: Padding(
              padding: paddingH20,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 15,
                      color: black54,
                    ),
                    sizeW10,
                    KText(
                      text: 'May 2022',
                      fontSize: 12,
                      color: black54,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
 
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          sizeH20,
          Container(
            color: white,
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  title: 'মোট বিড',
                  money: '0',
                  iconData: Icons.balance,
                ),
                customText(
                  title: 'মোট অপেক্ষমান বিড',
                  money: '0',
                  iconData: Icons.balance,
                ),
                customText(
                  title: 'মোট সম্পন্ন ট্রিপ',
                  money: '0',
                  iconData: Icons.where_to_vote,
                  cirleColor: blue,
                ),
                // customText(
                //   title: 'মোট নিশ্চিত বিড',
                //   money: '0',
                //   iconData: Ionicons.car,
                // ),
                customText(
                  title: 'মোট আয়',
                  money: '0 BDT',
                  cirleColor: Colors.green,
                  iconData: Icons.credit_card,
                ),
                customText(
                  title: 'মোট গাড়ি',
                  money: '0',
                  iconData: Ionicons.car,
                ),
                customText(
                  title: 'মোট ড্রাইভার',
                  money: '0',
                  iconData: Ionicons.person,
                  iconSize: 15,
                  cirleColor: Colors.deepPurple,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  customText({
    required String? title,
    required String? money,
    required IconData? iconData,
    Color? cirleColor,
    double? iconSize,
  }) {
    return Container(
      color: white,
      child: Padding(
        padding: paddingH20,
        child: Column(
          children: [
            sizeH10,
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: cirleColor ?? primaryColor,
                  radius: 18,
                  child: Icon(
                    iconData,
                    color: white,
                    size: iconSize ?? 20,
                  ),
                ),
                sizeW20,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KText(
                      text: title,
                      color: black45,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    KText(
                      text: money,
                      color: black,
                      fontWeight: FontWeight.bold,
                    ),
                    sizeH5,
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width / 1.4,
                          child: Container(
                            height: .7,
                            color: grey.shade100,
                          ),
                        ),
                      ],
                    ),
                    sizeH5,
                  ],
                ),
                // Spacer(),
                // isArrowOff == true
                //     ? Container()
                //     : Icon(
                //         Icons.arrow_forward_ios,
                //         size: 12,
                //         color: black54,
                //       ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

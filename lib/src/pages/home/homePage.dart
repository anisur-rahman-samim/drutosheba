import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/pages/credit/creditPage.dart';
import 'package:druto_seba_driver/src/pages/drawerPage/notificationsPage.dart';
import 'package:druto_seba_driver/src/pages/trip/returnTripPage.dart';
import 'package:druto_seba_driver/src/pages/trip/tripRequestPage.dart';
import 'package:druto_seba_driver/src/pages/userAccount/profilePage.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final isShowCreadit = RxBool(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 70),
        child: AppBar(
          backgroundColor: white,
          leading: GestureDetector(
            onTap: () => Get.to(ProfilePage()),
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: transparent,
                backgroundImage: AssetImage(
                  'assets/img/profile.png',
                ),
              ),
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KText(
                text: 'Abdur Rashid',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              sizeH10,
              Obx(
                () => GestureDetector(
                  onTap: isShowCreadit.value == true
                      ? () {
                          Get.to(CreditPage());
                          Future.delayed(Duration(seconds: 1)).then(
                            (value) => isShowCreadit.value = false,
                          );
                        }
                      : () {
                          isShowCreadit.value = true;
                        },
                  child: Container(
                    width: isShowCreadit.value == true ? 150 : 140,
                    decoration: BoxDecoration(
                      color: grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.credit_card,
                            color: black,
                            size: 15,
                          ),
                          sizeW10,
                          KText(
                            text: isShowCreadit.value == true
                                ? 'মোট ক্রেডিট 500'
                                : 'ক্রেডিট দেখুন',
                            fontSize: 12,
                          ),
                          sizeW10,
                          Icon(
                            Icons.arrow_forward_ios,
                            color: black,
                            size: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () => Get.to(NotificationsPage()),
              splashRadius: 1,
              icon: Icon(
                Icons.notifications_outlined,
                size: 40,
                color: black,
              ),
            ),
            sizeW10,
          ],
        ),
      ),
      body: Padding(
        padding: paddingH10,
        child: ListView(
          children: [
            sizeH10,
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/img/banner.jpg',
              ),
            ),
            sizeH10,
            Row(
              children: [
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    child: KText(
                      text: 'নতুন',
                      fontSize: 12,
                      color: white,
                    ),
                  ),
                ),
              ],
            ),
            sizeH10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomCardWidget(
                    onTap: () => Get.to(TripRequestPage()),
                    radius: 10,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_taxi,
                          ),
                          sizeW10,
                          KText(text: 'রেন্টাল ট্রিপ'),
                        ],
                      ),
                    ),
                  ),
                ),
                sizeW10,
                Expanded(
                  child: CustomCardWidget(
                    onTap: () => Get.to(ReturnTripPage()),
                    radius: 10,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.taxi_alert,
                          ),
                          sizeW10,
                          KText(text: 'রিটার্ন ট্রিপ'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            sizeH10,
            Container(
              decoration: BoxDecoration(
                color: primaryColor50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: paddingH10V10,
                child: Column(
                  children: [
                    sizeH10,
                    Image.asset(
                      'assets/icon/gift.png',
                      height: 50,
                    ),
                    sizeH10,
                    KText(
                      text: 'যত বেশি রেফার তত বেশি আয়',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    KText(
                      text: '''পরিচিত বা বন্ধুদের রেফার কোড শেয়ার করে আয় 
করুন''',
                      textAlign: TextAlign.center,
                      fontSize: 16,
                    ),
                    sizeH10,
                  ],
                ),
              ),
            ),
            sizeH10,
          ],
        ),
      ),
    );
  }
}

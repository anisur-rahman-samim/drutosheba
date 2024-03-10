import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/configs/app_images.dart';
import 'package:druto_seba_driver/src/modules/userAccount/controller/profile_controller.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/cached_network_image/cached_network_image.dart';
import 'package:druto_seba_driver/src/widgets/header_title/header_title.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../drawerPage/notificationsPage.dart';
import '../trip/returnTripPage.dart';
import '../trip/tripRequestPage.dart';
import '../userAccount/views/profilePage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProfileController profileController = Get.put(ProfileController());
  final isShowCreadit = RxBool(false);
  bool _isAnimation = false;
  bool _isBalanceShown = false;
  bool _isBalance = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: Size(0, 120),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
          child: Obx(() => profileController.isLoading.value == true? CustomLoader(color: white, size: 20) : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.to(() => ProfilePage(),transition: Transition.circularReveal),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white)
                        ),
                        child: ClipOval(child: Image.network(Api.getImageURL(profileController.profileModel.value.data!.image.toString()), fit: BoxFit.fill,)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(
                        text: profileController.profileModel.value.data?.name.toString(),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: white,
                      ),
                      //sizeH10,
                      InkWell(
                        onTap: animate,
                        child: Container(
                          width: 150,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Stack(alignment: Alignment.center, children: [
                            //Amount
                            AnimatedOpacity(
                              opacity: _isBalanceShown ? 1 : 0,
                              duration: Duration(milliseconds: 500),
                              child: Text(
                                  "500 TK",
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),

                            //Balance
                            AnimatedOpacity(
                                opacity: _isBalance ? 1 : 0,
                                duration: const Duration(milliseconds: 300),
                                child: Text('Tap for balance',
                                    style: TextStyle(
                                        color: Color(0xFFec6c1f),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800))),

                            //Circle
                            AnimatedPositioned(
                                duration: const Duration(milliseconds: 1100),
                                left: _isAnimation == false ? 5 : 130,
                                curve: Curves.fastOutSlowIn,
                                child: Container(
                                    height: 20,
                                    width: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: black,
                                        borderRadius: BorderRadius.circular(50)),
                                    child: FittedBox(
                                        child: Text('৳',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 17)))))
                          ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () => Get.to(() =>NotificationsPage(),transition: Transition.circularReveal),
                splashRadius: 1,
                icon: Icon(
                  Icons.notifications_outlined,
                  size: 40,
                  color: white,
                ),
              ),

            ],
          ))

        ),
      ),
      body: Padding(
        padding: paddingH10,
        child: ListView(
          children: [
            sizeH10,
            HeaderTitle(title: "Choose your Desire"),
            sizeH10,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.to(() => TripRequestPage(),transition: Transition.circularReveal),
                    child: Image.asset(
                      'assets/img/Rental-Trip-2.png',
                      width: 230,
                      height: 280,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => ReturnTripPage(),transition: Transition.circularReveal),
                    child: Image.asset(
                      'assets/img/Rental-Trip.png',
                      width: 230,
                      height: 280,
                    ),
                  ),
                ],
              ),
            ),
            sizeH10,
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                AppImages.banner,
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
           /* sizeH10,
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
            ),*/
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
            sizeH40,
          ],
        ),
      ),
    );

  }
  void animate() async {
    _isAnimation = true;
    _isBalance = false;
    setState(() {});

    await Future.delayed(Duration(milliseconds: 800),
            () => setState(() => _isBalanceShown = true));
    await Future.delayed(
        Duration(seconds: 3), () => setState(() => _isBalanceShown = false));
    await Future.delayed(Duration(milliseconds: 200),
            () => setState(() => _isAnimation = false));
    await Future.delayed(
        Duration(milliseconds: 800), () => setState(() => _isBalance = true));
  }
}

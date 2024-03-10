import 'package:druto_seba_driver/src/pages/allGari/gariListPage.dart';
import 'package:druto_seba_driver/src/pages/auth/loginPage.dart';
import 'package:druto_seba_driver/src/pages/credit/creditPage.dart';
import 'package:druto_seba_driver/src/pages/drawerPage/dashboardPage.dart';
import 'package:druto_seba_driver/src/pages/drawerPage/leaderBoardPage.dart';
import 'package:druto_seba_driver/src/pages/driver/driverPage.dart';
import 'package:druto_seba_driver/src/pages/penalty/views/penalty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/card/customCardWidget.dart';
import '../../widgets/text/kText.dart';
import '../drawerPage/helpPage.dart';
import '../drawerPage/notificationsPage.dart';
import '../drawerPage/offerPage.dart';
import '../drawerPage/settingsPage.dart';
import '../userAccount/views/profilePage.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.shade200,
      body: ListView(
        children: [
          CustomCardWidget(
            radius: 0,
            elevation: .5,
            onTap: () => Get.to(() => ProfilePage()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        'assets/img/profile.png',
                      ),
                    ),
                    Positioned(
                      bottom: -5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          child: Row(
                            children: [
                              KText(
                                text: '5.0 ',
                                fontSize: 12,
                              ),
                              Icon(
                                Icons.star,
                                size: 9,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                sizeW10,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KText(
                      text: 'Anisur Rahman',
                      color: black,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                    KText(
                      text: '+8801700000000',
                      color: black54,
                      fontSize: 16,
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: black.withOpacity(.5),
                ),
              ],
            ),
          ),
          sizeH20,
          CustomCardWidget(
            elevation: .5,
            radius: 0,
            child: Column(
              children: [
                _listTile(
                  onTap: () => Get.to(() => CreditPage()),
                  leadingIcon: Icons.credit_card,
                  title: 'ক্রেডিট',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                _listTile(
                  onTap: () => Get.to(() => GariListPage()),
                  leadingIcon: Icons.local_taxi,
                  title: 'গাড়ি',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                _listTile(
                  onTap: () => Get.to(() => DriverPage()),
                  leadingIcon: Icons.person,
                  title: 'ড্রাইভার',
                ),
              ],
            ),
          ),
          sizeH20,
          CustomCardWidget(
            elevation: .5,
            radius: 0,
            child: Column(
              children: [
                _listTile(
                  onTap: () => Get.to(() => ProfilePage()),
                  leadingIcon: Icons.person_outline,
                  title: 'প্রোফাইল',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                _listTile(
                  onTap: () => Get.to(() => DashboardPage()),
                  leadingIcon: Icons.dashboard_outlined,
                  title: 'ড্যাশবোর্ড',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                _listTile(
                  onTap: () => Get.to(() => LeaderBoardPage()),
                  leadingIcon: Ionicons.ribbon_outline,
                  title: 'লিডারবোর্ড',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                sizeH10,
                _listTile(
                  onTap: () {
                    Get.to(() => PenaltyView());
                  },
                  leadingIcon: Ionicons.document_text_outline,
                  title: 'জরিমানা',
                ),
              ],
            ),
          ),
          sizeH20,
          CustomCardWidget(
            elevation: .5,
            radius: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KText(
                  text: 'অন্যান্য',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                _listTile(
                  onTap: () => Get.to(() => NotificationsPage()),
                  leadingIcon: Icons.notifications_outlined,
                  title: 'নোটিফিকেশন',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                _listTile(
                  onTap: () => Get.to(() => OfferPage()),
                  leadingIcon: Ionicons.gift_outline,
                  title: 'অফার',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                _listTile(
                  onTap: () {},
                  leadingIcon: Icons.share_outlined,
                  title: 'রেফার',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                _listTile(
                  onTap: () => Get.to(() => SettingsPage()),
                  leadingIcon: Ionicons.settings_outline,
                  title: 'সেটিংস',
                ),
              ],
            ),
          ),
          sizeH20,
          CustomCardWidget(
            elevation: .5,
            radius: 0,
            child: Column(
              children: [
                _listTile(
                  onTap: () => Get.to(() => HelpPage()),
                  leadingIcon: Icons.help_outline,
                  title: 'সাহায্য',
                  textColor: blue,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                _listTile(
                  onTap: () => Get.to(() => LoginPage()),
                  leadingIcon: Icons.logout,
                  title: 'লগআউট',
                  textColor: primaryColor,
                ),
                sizeH40,
                sizeH40,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listTile({
    required void Function() onTap,
    IconData? leadingIcon,
    required String title,
    String? subTitle,
    bool? isHideArrow,
    Color? textColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5),
      child: Padding(
        padding: paddingV10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leadingIcon == null
                ? Container()
                : Icon(
                    leadingIcon,
                    color: textColor,
                  ),
            leadingIcon == null ? Container() : sizeW20,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KText(
                  text: title,
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                subTitle == null
                    ? Container()
                    : KText(
                        text: subTitle.toString(),
                        fontSize: 14,
                        color: black54,
                      ),
              ],
            ),
            Spacer(),
            isHideArrow == true
                ? Container()
                : Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: black54,
                  ),
          ],
        ),
      ),
    );
  }
}

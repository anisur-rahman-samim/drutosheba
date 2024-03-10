
import 'package:druto_seba_driver/src/modules/auth/views/loginPage.dart';
import 'package:druto_seba_driver/src/modules/credit/creditPage.dart';
import 'package:druto_seba_driver/src/modules/drawerPage/dashboardPage.dart';
import 'package:druto_seba_driver/src/modules/drawerPage/helpPage.dart';
import 'package:druto_seba_driver/src/modules/drawerPage/leaderBoardPage.dart';
import 'package:druto_seba_driver/src/modules/drawerPage/notificationsPage.dart';
import 'package:druto_seba_driver/src/modules/drawerPage/offerPage.dart';
import 'package:druto_seba_driver/src/modules/drawerPage/settingsPage.dart';
import 'package:druto_seba_driver/src/modules/drawerPage/tikaPage.dart';
import 'package:druto_seba_driver/src/modules/driver/driverPage.dart';
import 'package:druto_seba_driver/src/modules/userAccount/views/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/text/kText.dart';

class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: Get.width,
          color: primaryColor,
          child: SafeArea(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: primaryColor,
                  backgroundImage: AssetImage(
                    'assets/img/profile.png',
                  ),
                ),
                sizeH10,
                KText(
                  text: 'Fsd Ramjan',
                  color: white,
                  fontSize: 16,
                ),
                sizeH5,
                KText(
                  text: '01771282104',
                  color: white,
                  fontSize: 16,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: Get.height / 1.35,
          child: ListView(
            shrinkWrap: true,
            primary: false,
            children: [
              customListTile(
                onTap: () => Get.to(() => ProfilePage(),transition: Transition.circularReveal),
                title: 'প্রোফাইল',
                icons: Ionicons.person_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => DashboardPage(),transition: Transition.circularReveal),
                title: 'ড্যাশবোর্ড',
                icons: Ionicons.grid_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => LeaderBoardPage(),transition: Transition.circularReveal),
                title: 'লিডারবোর্ড',
                icons: Ionicons.ribbon_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => DriverPage(),transition: Transition.circularReveal),
                title: 'ড্রাইভার',
                icons: Ionicons.person_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => CreditPage(),transition: Transition.circularReveal),
                title: 'ক্রেডিট',
                icons: Ionicons.card_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => OfferPage(),transition: Transition.circularReveal),
                title: 'অফার',
                icons: Ionicons.gift_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => TikaPage(),transition: Transition.circularReveal),
                title: 'টিকা',
                icons: Ionicons.bag_add_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => NotificationsPage(),transition: Transition.circularReveal),
                title: 'নোটিফিকেশন',
                icons: Ionicons.notifications_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => HelpPage(),transition: Transition.circularReveal),
                title: 'সাহায্য',
                icons: Ionicons.help_circle_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => SettingsPage(),transition: Transition.circularReveal),
                title: 'সেটিংস',
                icons: Ionicons.settings_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => _showDialog(context),
                title: 'লগ আউট',
                icons: Ionicons.log_out_outline,
              ),
            ],
          ),
        ),
      ],
    );
  }

  customListTile({
    required void Function() onTap,
    required title,
    required IconData icons,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: paddingH20V10,
        child: Row(
          children: [
            Icon(
              icons,
            ),
            sizeW20,
            KText(
              text: title,
              fontSize: 16,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                KText(
                  text: 'আপনি কি লগ আউট করতে চান?',
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: KText(
                text: 'না',
                color: primaryColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: KText(
                text: 'হ্যাঁ',
                color: primaryColor,
              ),
              onPressed: () {
                Get.to(() => LoginPage(),transition: Transition.circularReveal);
              },
            ),
          ],
        );
      },
    );
  }
}

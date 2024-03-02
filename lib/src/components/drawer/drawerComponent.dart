import 'package:druto_seba_driver/src/pages/auth/loginPage.dart';
import 'package:druto_seba_driver/src/pages/credit/creditPage.dart';
import 'package:druto_seba_driver/src/pages/drawerPage/dashboardPage.dart';
import 'package:druto_seba_driver/src/pages/driver/driverPage.dart';
import 'package:druto_seba_driver/src/pages/drawerPage/helpPage.dart';
import 'package:druto_seba_driver/src/pages/drawerPage/settingsPage.dart';
import 'package:druto_seba_driver/src/pages/drawerPage/tikaPage.dart';
import 'package:druto_seba_driver/src/pages/userAccount/views/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../pages/drawerPage/leaderBoardPage.dart';
import '../../pages/drawerPage/notificationsPage.dart';
import '../../pages/drawerPage/offerPage.dart';
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
                onTap: () => Get.to(() => ProfilePage()),
                title: 'প্রোফাইল',
                icons: Ionicons.person_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => DashboardPage()),
                title: 'ড্যাশবোর্ড',
                icons: Ionicons.grid_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => LeaderBoardPage()),
                title: 'লিডারবোর্ড',
                icons: Ionicons.ribbon_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => DriverPage()),
                title: 'ড্রাইভার',
                icons: Ionicons.person_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => CreditPage()),
                title: 'ক্রেডিট',
                icons: Ionicons.card_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => OfferPage()),
                title: 'অফার',
                icons: Ionicons.gift_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => TikaPage()),
                title: 'টিকা',
                icons: Ionicons.bag_add_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => NotificationsPage()),
                title: 'নোটিফিকেশন',
                icons: Ionicons.notifications_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => HelpPage()),
                title: 'সাহায্য',
                icons: Ionicons.help_circle_outline,
              ),
              Divider(),
              customListTile(
                onTap: () => Get.to(() => SettingsPage()),
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
                Get.to(() => LoginPage());
              },
            ),
          ],
        );
      },
    );
  }
}

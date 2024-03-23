import 'package:druto_seba_driver/src/configs/app_texts.dart';
import 'package:druto_seba_driver/src/modules/auth/controller/reviews_controller.dart';
import 'package:druto_seba_driver/src/modules/drawerPage/view/trams_and_condition.dart';
import 'package:druto_seba_driver/src/modules/userAccount/controller/profile_controller.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/card/customCardWidget.dart';
import '../../widgets/text/kText.dart';
import '../allGari/views/gariListPage.dart';
import '../auth/views/loginPage.dart';
import '../credit/creditPage.dart';
import '../drawerPage/controller/leaderboard_controller.dart';
import '../drawerPage/dashboardPage.dart';
import '../drawerPage/helpPage.dart';
import '../drawerPage/view/leaderBoardPage.dart';
import '../drawerPage/notificationsPage.dart';
import '../drawerPage/view/offerPage.dart';
import '../drawerPage/settingsPage.dart';
import '../drawerPage/view/privecy_policy.dart';
import '../driver/driverPage.dart';
import '../penalty/views/penalty_view.dart';
import '../userAccount/views/profilePage.dart';

class MenuPage extends StatefulWidget {
   MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final ProfileController profileController = Get.put(ProfileController());

   final LeaderboardController leaderboardController = Get.put(LeaderboardController());

   final ReviewsController reviewsController = Get.put(ReviewsController());

   @override
  void initState() {
     reviewsController.getReviews(partnerId: profileController.profileModel.value.data?.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: grey.shade200,
      body: Obx(() => ListView(
        children: [
          CustomCardWidget(
            radius: 0,
            elevation: .5,
            onTap: () => Get.to(() => ProfilePage(),transition: Transition.circularReveal),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        Api.getImageURL(profileController.profileModel.value.data?.image),
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
                                text: '${reviewsController.reviewsModel.value.data?.averageStar} ',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text: profileController.profileModel.value.data?.name,
                          color: black,
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                        KText(
                          text: profileController.profileModel.value.data?.phone,
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
                  onTap: () => Get.to(() => CreditPage(),transition: Transition.circularReveal),
                  leadingIcon: Icons.credit_card,
                  title: 'ক্রেডিট',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                _listTile(
                  onTap: () => Get.to(() => GariListPage(),transition: Transition.circularReveal),
                  leadingIcon: Icons.local_taxi,
                  title: 'গাড়ি',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                _listTile(
                  onTap: () => Get.to(() => DriverPage(),transition: Transition.circularReveal),
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
                  onTap: () => Get.to(() => ProfilePage(),transition: Transition.circularReveal),
                  leadingIcon: Icons.person_outline,
                  title: 'প্রোফাইল',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                _listTile(
                  onTap: () => Get.to(() => DashboardPage(),transition: Transition.circularReveal),
                  leadingIcon: Icons.dashboard_outlined,
                  title: 'ড্যাশবোর্ড',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                _listTile(
                  onTap: () => Get.to(() => LeaderBoardPage(),transition: Transition.circularReveal),
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
                    Get.to(() => PenaltyView(),transition: Transition.circularReveal);
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
                  onTap: () => Get.to(() => NotificationsPage(),transition: Transition.circularReveal),
                  leadingIcon: Icons.notifications_outlined,
                  title: 'নোটিফিকেশন',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                _listTile(
                  onTap: () => Get.to(() => OfferPage(),transition: Transition.circularReveal),
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
                  onTap: () => Get.to(() => SettingsPage(),transition: Transition.circularReveal),
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
                  onTap: () => Get.to(() => HelpPage(),transition: Transition.circularReveal),
                  leadingIcon: Icons.help_outline,
                  title: 'সাহায্য',
                  textColor: blue,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                _listTile(
                  onTap: () => Get.to(() => TramsAndCondition(),transition: Transition.circularReveal),
                  leadingIcon: Icons.contact_page_outlined,
                  title: 'ট্রামস এন্ড কন্ডিশন',
                  textColor: primaryColor,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                _listTile(
                  onTap: () => Get.to(() => PrivacyPolicy(),transition: Transition.circularReveal),
                  leadingIcon: Icons.policy,
                  title: 'প্রাইভেসি পলিসি ',
                  textColor: primaryColor,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Divider(),
                ),
                _listTile(
                  onTap: () async {
                   await LocalStorage.removeData(key: AppTexts.token);
                    Get.to(() => LoginPage(),transition: Transition.circularReveal);
                  },
                  leadingIcon: Icons.logout,
                  title: 'লগ আউট',
                  textColor: primaryColor,
                ),
                sizeH40,
                sizeH40,
              ],
            ),
          ),
        ],
      )),
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

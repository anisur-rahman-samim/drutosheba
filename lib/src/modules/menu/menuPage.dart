import 'package:druto_seba_driver/src/configs/app_texts.dart';
import 'package:druto_seba_driver/src/modules/auth/controller/reviews_controller.dart';
import 'package:druto_seba_driver/src/modules/drawerPage/view/trams_and_condition.dart';
import 'package:druto_seba_driver/src/modules/userAccount/controller/profile_controller.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/services/local_storage.dart';
import 'package:druto_seba_driver/src/services/text_styles.dart';
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
    body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(profileController.profileModel.value.data!.name.toString(),style: h4.copyWith(color: white),),
            background: Image.network(
             Api.getImageURL(profileController.profileModel.value.data?.image),
              fit: BoxFit.cover,
            ),
          ),
          floating: true,
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              CustomCardWidget(
                elevation: .5,
                radius: 0,
                child: Column(
                  children: [

                    ListTile(
                      onTap: () => Get.to(() => CreditPage(),transition: Transition.circularReveal),
                      leading: Image.asset("assets/menu/payment.png",scale: 25,),
                      title: Text('ক্রেডিট',style: h1.copyWith(fontSize: 16),),
                      trailing: CircleAvatar(
                        radius: 14,
                        backgroundColor: black,
                        child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                      ),
                    ),
                    ListTile(
                      onTap: () => Get.to(() => GariListPage(),transition: Transition.circularReveal),
                      leading: Image.asset("assets/menu/sport-car.png",scale: 16,),
                      title: Text('গাড়ি',style: h1.copyWith(fontSize: 16),),
                      trailing: CircleAvatar(
                        radius: 14,
                        backgroundColor: black,
                        child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                      ),
                    ),
                    ListTile(
                      onTap: () => Get.to(() => DriverPage(),transition: Transition.circularReveal),
                      leading: Image.asset("assets/menu/driver.png",scale: 20,),
                      title: Text('ড্রাইভার',style: h1.copyWith(fontSize: 16),),
                      trailing: CircleAvatar(
                        radius: 14,
                        backgroundColor: black,
                        child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                      ),
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
                    ListTile(
                      onTap: () => Get.to(() => ProfilePage(),transition: Transition.circularReveal),
                      leading: Image.asset("assets/menu/user.png",scale: 20,),
                      title: Text('প্রোফাইল',style: h1.copyWith(fontSize: 16),),
                      trailing: CircleAvatar(
                        radius: 14,
                        backgroundColor: black,
                        child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                      ),
                    ),
                    ListTile(
                      onTap: () => Get.to(() => DashboardPage(),transition: Transition.circularReveal),
                      leading: Image.asset("assets/menu/dashboard.png",scale: 25,),
                      title: Text('ড্যাশবোর্ড',style: h1.copyWith(fontSize: 16),),
                      trailing: CircleAvatar(
                        radius: 14,
                        backgroundColor: black,
                        child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                      ),
                    ),
                    ListTile(
                      onTap: () => Get.to(() => LeaderBoardPage(),transition: Transition.circularReveal),
                      leading: Image.asset("assets/menu/ranking.png",scale: 25,),
                      title: Text('লিডারবোর্ড',style: h1.copyWith(fontSize: 16),),
                      trailing: CircleAvatar(
                        radius: 14,
                        backgroundColor: black,
                        child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                      ),
                    ),

                    ListTile(
                      onTap: () => Get.to(() => PenaltyView(),transition: Transition.circularReveal),
                      leading: Image.asset("assets/menu/documents.png",scale: 25,),
                      title: Text('জরিমানা',style: h1.copyWith(fontSize: 16),),
                      trailing: CircleAvatar(
                        radius: 14,
                        backgroundColor: black,
                        child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                      ),
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
                    ListTile(
                      onTap: () => Get.to(() => NotificationsPage(),transition: Transition.circularReveal),
                      leading: Image.asset("assets/menu/notification.png",scale: 25,),
                      title: Text('নোটিফিকেশন',style: h1.copyWith(fontSize: 16),),
                      trailing: CircleAvatar(
                        radius: 14,
                        backgroundColor: black,
                        child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                      ),
                    ),
                    ListTile(
                      onTap: () => Get.to(() => OfferPage(),transition: Transition.circularReveal),
                      leading: Image.asset("assets/menu/gift.png",scale: 25,),
                      title: Text('অফার',style: h1.copyWith(fontSize: 16),),
                      trailing: CircleAvatar(
                        radius: 14,
                        backgroundColor: black,
                        child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                      ),
                    ),
                    ListTile(
                      onTap: () => Get.to(() => SettingsPage(),transition: Transition.circularReveal),
                      leading: Image.asset("assets/menu/settings.png",scale: 25,),
                      title: Text('সেটিংস',style: h1.copyWith(fontSize: 16),),
                      trailing: CircleAvatar(
                        radius: 14,
                        backgroundColor: black,
                        child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                      ),
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
                    ListTile(
                      onTap: () => Get.to(() => HelpPage(),transition: Transition.circularReveal),
                      leading: Image.asset("assets/menu/help.png",scale: 25,),
                      title: Text('সাহায্য',style: h1.copyWith(fontSize: 16),),
                      trailing: CircleAvatar(
                        radius: 14,
                        backgroundColor: black,
                        child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                      ),
                    ),

                    ListTile(
                      onTap: () => Get.to(() => TramsAndCondition(),transition: Transition.circularReveal),
                      leading: Image.asset("assets/menu/min.png",scale: 25,),
                      title: Text('ট্রামস এন্ড কন্ডিশন',style: h1.copyWith(fontSize: 16),),
                      trailing: CircleAvatar(
                        radius: 14,
                        backgroundColor: black,
                        child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                      ),
                    ),

                    ListTile(
                      onTap: () => Get.to(() => PrivacyPolicy(),transition: Transition.circularReveal),
                      leading: Image.asset("assets/menu/insurance.png",scale: 25,),
                      title: Text('প্রাইভেসি পলিসি',style: h1.copyWith(fontSize: 16),),
                      trailing: CircleAvatar(
                        radius: 14,
                        backgroundColor: black,
                        child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                      ),
                    ),

                    ListTile(
                      onTap: () {
                        Get.defaultDialog(
                            title: "Logout",
                            middleText: "You want to logout",
                            onCancel: () => Get.back(),
                            onConfirm: ()async{
                              await LocalStorage.removeData(key: AppTexts.token);
                              Get.to(() => LoginPage(),transition: Transition.circularReveal);
                            }
                        );
                      },
                      leading: Image.asset("assets/menu/logout.png",scale: 20,),
                      title: Text('লগ আউট',style: h1.copyWith(fontSize: 16),),
                      trailing: CircleAvatar(
                        radius: 14,
                        backgroundColor: black,
                        child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                      ),
                    ),

                    sizeH40,
                  ],
                ),
              ),

            ],
          ),
        ),
      ],
    ),
    /*  body: Obx(() => ListView(
        children: [
          SizedBox(
            height: 500,
            child:   Container(
             // height: Get.height / 3,
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: primaryColor
              ),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                           CustomCardWidget(
            elevation: .5,
            radius: 0,
            child: Column(
              children: [

                ListTile(
                  onTap: () => Get.to(() => CreditPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/payment.png",scale: 25,),
                  title: Text('ক্রেডিট',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),
                ListTile(
                  onTap: () => Get.to(() => GariListPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/sport-car.png",scale: 16,),
                  title: Text('গাড়ি',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),
                ListTile(
                  onTap: () => Get.to(() => DriverPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/driver.png",scale: 20,),
                  title: Text('ড্রাইভার',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
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
                ListTile(
                  onTap: () => Get.to(() => ProfilePage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/user.png",scale: 20,),
                  title: Text('প্রোফাইল',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),
                ListTile(
                  onTap: () => Get.to(() => DashboardPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/dashboard.png",scale: 25,),
                  title: Text('ড্যাশবোর্ড',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),
                ListTile(
                  onTap: () => Get.to(() => LeaderBoardPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/ranking.png",scale: 25,),
                  title: Text('লিডারবোর্ড',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),

                ListTile(
                  onTap: () => Get.to(() => PenaltyView(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/documents.png",scale: 25,),
                  title: Text('জরিমানা',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
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
                ListTile(
                  onTap: () => Get.to(() => NotificationsPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/notification.png",scale: 25,),
                  title: Text('নোটিফিকেশন',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),
                ListTile(
                  onTap: () => Get.to(() => OfferPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/gift.png",scale: 25,),
                  title: Text('অফার',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),
                ListTile(
                  onTap: () => Get.to(() => SettingsPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/settings.png",scale: 25,),
                  title: Text('সেটিংস',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
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
                ListTile(
                  onTap: () => Get.to(() => HelpPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/help.png",scale: 25,),
                  title: Text('সাহায্য',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),

                ListTile(
                  onTap: () => Get.to(() => TramsAndCondition(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/min.png",scale: 25,),
                  title: Text('ট্রামস এন্ড কন্ডিশন',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),

                ListTile(
                  onTap: () => Get.to(() => PrivacyPolicy(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/insurance.png",scale: 25,),
                  title: Text('প্রাইভেসি পলিসি',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),

                ListTile(
                  onTap: () {
                    Get.defaultDialog(
                      title: "Logout",
                      middleText: "You want to logout",
                      onCancel: () => Get.back(),
                      onConfirm: ()async{
                        await LocalStorage.removeData(key: AppTexts.token);
                        Get.to(() => LoginPage(),transition: Transition.circularReveal);
                      }
                    );
                  },
                  leading: Image.asset("assets/menu/logout.png",scale: 20,),
                  title: Text('লগ আউট',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),

                sizeH40,
              ],
            ),
          ),
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
          ),
          sizeH20,
          CustomCardWidget(
            elevation: .5,
            radius: 0,
            child: Column(
              children: [

                ListTile(
                  onTap: () => Get.to(() => CreditPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/payment.png",scale: 25,),
                  title: Text('ক্রেডিট',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),
                ListTile(
                  onTap: () => Get.to(() => GariListPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/sport-car.png",scale: 16,),
                  title: Text('গাড়ি',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),
                ListTile(
                  onTap: () => Get.to(() => DriverPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/driver.png",scale: 20,),
                  title: Text('ড্রাইভার',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
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
                ListTile(
                  onTap: () => Get.to(() => ProfilePage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/user.png",scale: 20,),
                  title: Text('প্রোফাইল',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),
                ListTile(
                  onTap: () => Get.to(() => DashboardPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/dashboard.png",scale: 25,),
                  title: Text('ড্যাশবোর্ড',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),
                ListTile(
                  onTap: () => Get.to(() => LeaderBoardPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/ranking.png",scale: 25,),
                  title: Text('লিডারবোর্ড',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),

                ListTile(
                  onTap: () => Get.to(() => PenaltyView(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/documents.png",scale: 25,),
                  title: Text('জরিমানা',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
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
                ListTile(
                  onTap: () => Get.to(() => NotificationsPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/notification.png",scale: 25,),
                  title: Text('নোটিফিকেশন',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),
                ListTile(
                  onTap: () => Get.to(() => OfferPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/gift.png",scale: 25,),
                  title: Text('অফার',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),
                ListTile(
                  onTap: () => Get.to(() => SettingsPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/settings.png",scale: 25,),
                  title: Text('সেটিংস',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
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
                ListTile(
                  onTap: () => Get.to(() => HelpPage(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/help.png",scale: 25,),
                  title: Text('সাহায্য',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),

                ListTile(
                  onTap: () => Get.to(() => TramsAndCondition(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/min.png",scale: 25,),
                  title: Text('ট্রামস এন্ড কন্ডিশন',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),

                ListTile(
                  onTap: () => Get.to(() => PrivacyPolicy(),transition: Transition.circularReveal),
                  leading: Image.asset("assets/menu/insurance.png",scale: 25,),
                  title: Text('প্রাইভেসি পলিসি',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),

                ListTile(
                  onTap: () {
                    Get.defaultDialog(
                      title: "Logout",
                      middleText: "You want to logout",
                      onCancel: () => Get.back(),
                      onConfirm: ()async{
                        await LocalStorage.removeData(key: AppTexts.token);
                        Get.to(() => LoginPage(),transition: Transition.circularReveal);
                      }
                    );
                  },
                  leading: Image.asset("assets/menu/logout.png",scale: 20,),
                  title: Text('লগ আউট',style: h1.copyWith(fontSize: 16),),
                  trailing: CircleAvatar(
                    radius: 14,
                    backgroundColor: black,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: white,),
                  ),
                ),

                sizeH40,
              ],
            ),
          ),
        ],
      )),*/
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

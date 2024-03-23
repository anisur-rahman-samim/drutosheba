import 'package:druto_seba_driver/src/modules/auth/controller/reviews_controller.dart';
import 'package:druto_seba_driver/src/modules/menu/controller/ref_code_controller.dart';
import 'package:druto_seba_driver/src/modules/userAccount/controller/profile_controller.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../configs/appColors.dart';
import '../../../configs/appUtils.dart';
import '../../../widgets/text/kText.dart';
import '../../auth/views/changePasswordPage.dart';
import 'profileEditPage.dart';
import 'package:share_plus/share_plus.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());
  final ReviewsController reviewsController = Get.put(ReviewsController());
  final RefCodeController refCodeController = Get.put(RefCodeController());

  void shareData(String text) {
    Share.share(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 1,
        iconTheme: IconThemeData(color: black),
        title: KText(
          text: 'পার্টনার প্রোফাইল',
          fontSize: 20,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () => Get.to(() => ProfileEditPage(),transition: Transition.circularReveal),
              child: Container(
                decoration: BoxDecoration(
                  color: blue.shade50,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Center(
                    child: KText(
                      text: 'প্রোফাইল এডিট',
                      color: blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
          sizeW10,
        ],
      ),
      backgroundColor: grey.shade100,
      body: Obx(() => Padding(
        padding: paddingH10,
        child: ListView(
          children: [
            sizeH10,
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: grey.shade300,
                  width: .9,
                ),
                color: white,
              ),
              child: Padding(
                padding: paddingH20V10,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: white,
                          backgroundImage: NetworkImage(
                            Api.getImageURL(profileController.profileModel.value.data?.image),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 25,
                          child: Container(
                            width: 70,
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 9,
                                  ),
                                  sizeW5,
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        KText(
                          text: profileController.profileModel.value.data?.name,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        sizeH5,
                        KText(
                          text: profileController.profileModel.value.data?.phone,
                          fontSize: 14,
                          color: black54,
                        ),
                      ],
                    ),
                  
                  ],
                ),
              ),
            ),
            sizeH20,
            CustomCardWidget(
              borderColor: Colors.grey,
                color: white,
                radius: 10,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.badge),
                      title: Text("এনআইডি",style: h3.copyWith(color: black.withOpacity(0.5)),),
                      subtitle: Text(profileController.profileModel.value.data!.docNumber.toString(),style: h2,),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on_rounded),
                      title: Text("ঠিকানা",style: h3.copyWith(color: black.withOpacity(0.5)),),
                      subtitle: Text(profileController.profileModel.value.data!.address.toString(),style: h2,),
                    ),
                    ListTile(
                      leading: Icon(Icons.map),
                      title: Text("বিভাগ",style: h3.copyWith(color: black.withOpacity(0.5)),),
                      subtitle: Text(profileController.profileModel.value.data!.division.toString(),style: h2,),
                    ),
                    ListTile(
                      leading: Icon(Icons.mail),
                      title: Text("ইমেইল",style: h3.copyWith(color: black.withOpacity(0.5)),),
                      subtitle: Text(profileController.profileModel.value.data!.email.toString(),style: h2,),
                    ),
                    ListTile(
                      leading: Icon(Icons.transgender),
                      title: Text("লিঙ্গ",style: h3.copyWith(color: black.withOpacity(0.5)),),
                      subtitle: Text(profileController.profileModel.value.data!.gender.toString(),style: h2,),
                    ),

                  ],
                )),

            sizeH10,
            _button(
              onTap: () {},
              icon: Icons.record_voice_over,
              cirleColor: null,
              title: 'রেফারেল কোড',
              subTitle: refCodeController.myreferKey.value,
              action: GestureDetector(
                onTap: () {
                  shareData(refCodeController.myreferKey.value.toString());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: grey.shade100,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Icon(
                      Icons.share_rounded,
                      size: 15,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          onTap: () => Get.to(() => ChangePasswordPage(),transition: Transition.circularReveal),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: grey.shade300,
                width: .9,
              ),
              color: white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                KText(
                  text: "পাসওয়ার্ড পরিবর্তন করুন",
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 255, 51, 0),
                ),
                sizeW5,
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Color.fromARGB(255, 255, 51, 0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _button({
    required void Function()? onTap,
    required IconData icon,
    required String title,
    required String subTitle,
    required Color? cirleColor,
    Widget? action,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: grey.shade300,
            width: .9,
          ),
          color: white,
        ),
        child: Padding(
          padding: paddingH10V10,
          child: Row(
            children: [
              CircleAvatar(
                radius: 13,
                backgroundColor: cirleColor,
                child: Icon(
                  icon,
                  color: white,
                  size: 15,
                ),
              ),
              sizeW10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title == ''
                      ? Container()
                      : KText(
                          text: '$title',
                          fontSize: 12,
                          color: grey,
                        ),
                  KText(
                    text: '$subTitle',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Spacer(),
              action ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}


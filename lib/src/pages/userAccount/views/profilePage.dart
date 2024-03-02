import 'package:druto_seba_driver/src/pages/auth/changePasswordPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../configs/appColors.dart';
import '../../../configs/appUtils.dart';
import '../../../widgets/text/kText.dart';
import '../../auth/forgetPasswordPage.dart';
import 'profileEditPage.dart';

class ProfilePage extends StatelessWidget {
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
              onTap: () => Get.to(() => ProfileEditPage()),
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
      body: Padding(
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: white,
                      backgroundImage: AssetImage(
                        'assets/img/profile.png',
                      ),
                    ),
                    sizeW10,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text: 'Fsd',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        sizeH5,
                        KText(
                          text: '01771282104',
                          fontSize: 14,
                          color: black54,
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
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
                  ],
                ),
              ),
            ),
            sizeH20,
            _button(
              onTap: () {},
              icon: Icons.badge,
              cirleColor: Color.fromARGB(255, 255, 51, 0),
              title: 'এনআইডি',
              subTitle: '123456789',
            ),
            sizeH10,
            _button(
              onTap: () {},
              icon: Icons.location_on_rounded,
              cirleColor: Color.fromARGB(255, 82, 14, 207),
              title: 'ঠিকানা',
              subTitle: 'Mirpur',
            ),
            sizeH10,
            _button(
              onTap: () {},
              icon: Icons.map,
              cirleColor: Color.fromARGB(255, 82, 14, 207),
              title: 'বিভাগ',
              subTitle: 'Dhaka',
            ),
            sizeH10,
            _button(
              onTap: () {},
              icon: Icons.map,
              cirleColor: null,
              title: 'ইমেইল',
              subTitle: 'fsd.ramjan@gmail.com',
            ),
            sizeH10,
            _button(
              onTap: () {},
              icon: Icons.transgender,
              cirleColor: Colors.green,
              title: 'লিঙ্গ',
              subTitle: 'Male',
            ),
            sizeH10,
            _button(
              onTap: () {},
              icon: Icons.record_voice_over,
              cirleColor: null,
              title: 'রেফারেল কোড',
              subTitle: 'FGSHLA',
              action: GestureDetector(
                onTap: () {},
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
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          onTap: () => Get.to(() => ChangePasswordPage()),
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



// import 'package:druto_seba_driver/src/pages/userAccount/profileEditPage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../configs/appColors.dart';
// import '../../configs/appUtils.dart';
// import '../../widgets/text/kText.dart';

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: KText(
//           text: 'প্রোফাইল',
//           fontSize: 20,
//           color: white,
//         ),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             height: 170,
//             width: Get.width,
//             color: primaryColor,
//             child: SafeArea(
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: primaryColor,
//                     radius: 50,
//                     backgroundImage: AssetImage(
//                       'assets/img/profile.png',
//                     ),
//                   ),
//                   sizeH10,
//                   KText(
//                     text: 'Fsd Ramjan',
//                     color: white,
//                     fontSize: 16,
//                   ),
//                   sizeH5,
//                   KText(
//                     text: '01771282104',
//                     color: white,
//                     fontSize: 16,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: paddingH20V20,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 rawText(
//                   title: 'এনআইডি নম্বর / পাসপোর্ট',
//                   content: '123456789',
//                 ),
//                 sizeH10,
//                 Divider(),
//                 sizeH10,
//                 rawText(
//                   title: 'ঠিকানা',
//                   content: 'Mirpur',
//                 ),
//                 sizeH10,
//                 Divider(),
//                 sizeH10,
//                 rawText(
//                   title: 'লিঙ্গ',
//                   content: 'Male',
//                 ),
//                 sizeH10,
//                 Divider(),
//                 sizeH10,
//                 rawText(
//                   title: 'ইমেইল',
//                   content: 'fsd.ramjan@gmail.com',
//                 ),
//                 sizeH10,
//                 Divider(),
//                 sizeH10,
//                 rawText(
//                   title: 'বিভাগ',
//                   content: 'Dhaka',
//                 ),
//                 sizeH10,
//                 Divider(),
//                 sizeH10,
//                 Row(
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         KText(
//                           text: 'রেফারেল কোড',
//                           fontSize: 14,
//                           color: black45,
//                         ),
//                         KText(
//                           text: 'T3RI8E',
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: black54,
//                         ),
//                       ],
//                     ),
//                     Spacer(),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.share,
//                       ),
//                     ),
//                   ],
//                 ),
//                 sizeH10,
//                 Divider(),
//                 sizeH10,
//               ],
//             ),
//           )
//         ],
//       ),
//       bottomSheet: GestureDetector(
//         onTap: () => Get.to(ProfileEditPage()),
//         child: Container(
//           height: 70,
//           width: Get.width,
//           color: white,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.edit,
//                 color: black45,
//               ),
//               sizeW10,
//               KText(
//                 text: 'প্রোফাইল এডিট',
//                 color: black45,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   rawText({
//     required title,
//     required content,
//   }) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         KText(
//           text: title,
//           fontSize: 14,
//           color: black45,
//         ),
//         KText(
//           text: content,
//           fontSize: 16,
//           fontWeight: FontWeight.w600,
//           color: black54,
//         ),
//       ],
//     );
//   }
// }

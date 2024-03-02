import 'package:druto_seba_driver/src/widgets/formField/customFormField.dart';
import 'package:druto_seba_driver/src/widgets/formField/dropDownForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/button/outlineButton.dart';
import '../../widgets/card/customCardWidget.dart';
import '../../widgets/dottedDivider/dotDivider.dart';
import '../../widgets/text/kText.dart';

class TripListComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingH10,
      child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: 4,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: CustomCardWidget(
                color: white,
                radius: 10,
                child: Padding(
                  padding: paddingH20V10,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          KText(
                            text: 'ট্রিপ: ',
                            color: black54,
                          ),
                          KText(
                            text: 'JR1653890179ZF',
                            fontWeight: FontWeight.bold,
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: black,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  child: KText(
                                    text: 'MicroBus',
                                    fontSize: 14,
                                    color: white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 3),
                              KText(
                                text: '11 Seats',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                      sizeH10,
                      DotDividerWidget(
                        fillRate: .5,
                      ),
                      sizeH10,
                      SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 60,
                              child: Image.asset(
                                'assets/img/car5.png',
                                height: 60,
                                width: 60,
                              ),
                            ),
                            sizeW20,
                            Column(
                              children: [
                                sizeH5,
                                CircleAvatar(
                                  radius: 6,
                                  backgroundColor: black,
                                  child: CircleAvatar(
                                    backgroundColor: white,
                                    radius: 5,
                                  ),
                                ),
                                sizeH5,
                                Container(
                                  height: 50,
                                  width: .7,
                                  color: grey,
                                ),
                                sizeH5,
                                CircleAvatar(
                                  radius: 6,
                                  backgroundColor: primaryColor,
                                ),
                              ],
                            ),
                            sizeW10,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    KText(
                                      text: 'শুরু: ',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    // sizeW5,
                                    Container(
                                      width: Get.width / 2.2,
                                      child: KText(
                                        text: 'Panthapath,ঢাকা,বাংলাদেশ',
                                        fontSize: 14,
                                        maxLines: 2,
                                        color: black54,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    KText(
                                      text: 'শেষ: ',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    // sizeW5,
                                    Container(
                                      width: Get.width / 2.2,
                                      // color: primaryColor,
                                      child: KText(
                                        text:
                                            'Balipara Bridge,Balipara Bridge,বাংলাদেশ',
                                        fontSize: 14,
                                        maxLines: 2,
                                        color: black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      sizeH20,
                      outlineButton(
                        buttonName: 'ম্যাপ দেখুন',
                        textColor: black,
                        outlineColor: grey.shade300,
                        radius: 5,
                        height: 35,
                        width: 120,
                        fontSize: 14,
                        onTap: () {},
                      ),
                      sizeH10,
                      DotDividerWidget(
                        fillRate: .5,
                      ),
                      sizeH10,
                      rawText(
                        title: 'যাত্রার সময়',
                        content: '02 Jun 2022 12:59 PM',
                      ),
                      sizeH5,
                      rawText(
                        title: 'ফিরতি তারিখ',
                        content: '03 Jun 2022 12:59 PM',
                      ),
                      sizeH5,
                      rawText(
                        title: 'রাউন্ড ট্রিপ',
                        content: 'হ্যাঁ',
                      ),
                      sizeH5,
                      rawText(
                        title: 'দুরুত্ব',
                        content: '50.44 কি:মি',
                      ),
                      sizeH5,
                      rawText(
                        title: 'এয়ার কন্ডিশন',
                        content: 'Any',
                      ),
                      sizeH5,
                      Row(
                        children: [
                          rawText(
                            title: null,
                            content: '166 মিনিট আছে',
                          ),
                          Spacer(),
                          outlineButton(
                            buttonName: 'বিড',
                            textColor: white,
                            backgroundColor: primaryColor,
                            outlineColor: primaryColor,
                            radius: 5,
                            height: 35,
                            width: 80,
                            fontSize: 14,
                            onTap: () {
                              Get.defaultDialog(
                                title: 'বিড করুন',
                                titleStyle: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.bold,
                                ),
                                content: Column(
                                  children: [
                                    SizedBox(
                                      height: 70,
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: primaryColor50,
                                            child: Icon(
                                              Ionicons.car,
                                              color: primaryColor,
                                              size: 20,
                                            ),
                                          ),
                                          sizeW20,
                                          Column(
                                            children: [
                                              sizeH5,
                                              CircleAvatar(
                                                radius: 6,
                                                backgroundColor: black,
                                                child: CircleAvatar(
                                                  backgroundColor: white,
                                                  radius: 5,
                                                ),
                                              ),
                                              sizeH5,
                                              Expanded(
                                                child: Container(
                                                  width: .7,
                                                  color: grey,
                                                ),
                                              ),
                                              sizeH5,
                                              CircleAvatar(
                                                radius: 6,
                                                backgroundColor: primaryColor,
                                              ),
                                            ],
                                          ),
                                          sizeW10,
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  KText(
                                                    text: 'শুরু: ',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                  // sizeW5,
                                                  Container(
                                                    width: Get.width / 2.2,
                                                    child: KText(
                                                      text:
                                                          'Panthapath,ঢাকা,বাংলাদেশ',
                                                      fontSize: 14,
                                                      maxLines: 2,
                                                      color: black54,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  KText(
                                                    text: 'শেষ: ',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                  // sizeW5,
                                                  Container(
                                                    width: Get.width / 2.2,
                                                    // color: primaryColor,
                                                    child: KText(
                                                      text:
                                                          'Balipara Bridge,Balipara Bridge,বাংলাদেশ',
                                                      fontSize: 14,
                                                      maxLines: 2,
                                                      color: black54,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // sizeH20,
                                    dropDownForm(
                                      onTap: () {},
                                      title: '',
                                      hintText: 'গাড়ি নির্বাচন করুন',
                                      requiredText: '',
                                    ),

                                    sizeH20,

                                    customFormField(
                                      height: 45,
                                      outlineColor: grey.shade200,
                                      hintText: 'ভাড়া প্রবেশ করুন',
                                    ),
                                    sizeH10,

                                    Center(
                                      child: KText(
                                        text:
                                            'দ্রষ্টব্য: সমস্ত চার্জ অন্তর্ভুক্ত',
                                        fontWeight: FontWeight.w600,
                                        color: primaryColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                    sizeH10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () => Get.back(),
                                          child: KText(
                                            text: 'বাতিল',
                                            color: black45,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                            Get.snackbar(
                                              'Success!',
                                              'Bid Successfully Placed',
                                              colorText: white,
                                            );
                                          },
                                          child: KText(
                                            text: 'বিড',
                                            color: primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                              // Get.defaultDialog(
                              //   title: 'নোটিশ',

                              //   content: Column(
                              //     children: [
                              //       Divider(),
                              //       KText(
                              //         text:
                              //             'আপনার একাউন্ট এখন ও অনুমোদন করা হয় নি | আপনার একাউন্ট সচল হলে দয়া করে যাত্রী সাপোর্ট সেন্টার যোগাযোগ করুন',
                              //         fontSize: 15,
                              //         textAlign: TextAlign.center,
                              //         // fontWeight: FontWeight.w600,
                              //       ),
                              //       sizeH20,
                              //       GestureDetector(
                              //         onTap: () => Get.to(HelpPage()),
                              //         child: Padding(
                              //           padding: paddingH10,
                              //           child: Container(
                              //             child: Align(
                              //               alignment: Alignment.centerRight,
                              //               child: KText(
                              //                 text: 'যোগাযোগ করুন',
                              //                 fontSize: 15,
                              //                 fontWeight: FontWeight.w600,
                              //                 color: primaryColor,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }

  rawText({
    required title,
    required content,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KText(
            text: title == null ? '' : '$title:',
            fontSize: 14,
            color: black45,
          ),
          title == null ? sizeH10 : sizeW10,
          KText(
            text: content,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ],
      );
}

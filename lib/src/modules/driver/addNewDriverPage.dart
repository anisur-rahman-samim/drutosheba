import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/widgets/formField/requiredForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../configs/appColors.dart';
import '../../widgets/button/primaryButton.dart';
import '../../widgets/text/kText.dart';
import '../dashboard/dashboard.dart';
import 'controller/driver_image_controller.dart';

class AddNewDriverPage extends StatefulWidget {
  @override
  State<AddNewDriverPage> createState() => _AddNewDriverPageState();
}

class _AddNewDriverPageState extends State<AddNewDriverPage> {
  String gender = 'পুরুষ';
  final DriverImageController driverImageController =
      Get.put(DriverImageController());

  var profileImagePath;
  var drivingLicenceImagePath;
  var nidFrontImagePath ;
  var nidBackImagePath ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'নতুন ড্রাইভার যোগ করুন',
          fontSize: 20,
          color: white,
        ),
      ),
      body: Padding(
        padding: paddingH20,
        child: ListView(
          children: [
            sizeH20,
            Column(
              children: [
                Row(
                  children: [
                    KText(
                      text: 'ড্রাইভারের ছবি',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    KText(
                      text: ' *',
                      fontSize: 16,
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    profileImagePath == null
                        ? Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/img/profile.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        : Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: FileImage(
                            File(profileImagePath),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -20,
                      bottom: 30,
                      child: IconButton(
                        tooltip: 'Add Photo',
                        onPressed: () async{
                          String? imagePath = await driverImageController.captureImage(ImageSource.gallery);
                          setState(() {
                            profileImagePath = imagePath;
                          });

                        },
                        icon: CircleAvatar(
                          radius: 15,
                          backgroundColor: grey.shade200,
                          child: Icon(
                            Icons.add_a_photo,
                            size: 20,
                            color: black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            sizeH20,
            requiredForm(
              title: 'নাম',
              hintText: 'নাম লিখুন',
              requiredText: '*',
            ),
            sizeH20,
            requiredForm(
              title: 'মোবাইল নম্বর',
              hintText: 'মোবাইল নম্বর লিখুন',
              requiredText: '*',
            ),
            sizeH20,
            requiredForm(
              title: 'যোগাযোগ নম্বর',
              hintText: 'যোগাযোগ নম্বর লিখুন',
              requiredText: '*',
            ),
            sizeH20,
            requiredForm(
              title: 'ইমেইল',
              hintText: 'ইমেইল প্রদান করুন',
              requiredText: '*',
            ),
            sizeH20,
            Row(
              children: [
                KText(
                  text: 'লিঙ্গ',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                KText(
                  text: ' *',
                  fontSize: 16,
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'পুরুষ',
                  groupValue: gender,
                  activeColor: primaryColor,
                  onChanged: (String? value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                KText(
                  text: 'পুরুষ',
                  fontSize: 14,
                ),
                Radio(
                  value: 'মহিলা',
                  groupValue: gender,
                  activeColor: primaryColor,
                  onChanged: (String? value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                KText(
                  text: 'মহিলা',
                  fontSize: 14,
                ),
              ],
            ),
            sizeH20,
            sizeH20,
            requiredForm(
              title: 'ঠিকানা',
              hintText: 'ঠিকানা লিখুন',
              requiredText: '*',
            ),
            sizeH20,
            requiredForm(
              title: 'ড্রাইভিং লাইসেন্স নম্বর',
              hintText: 'ড্রাইভিং লাইসেন্স নম্বর প্রবেশ করান',
              requiredText: '*',
            ),
            sizeH20,
            Row(
              children: [
                KText(
                  text: 'ড্রাইভিং লাইসেন্সের ছবি',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                KText(
                  text: ' *',
                  fontSize: 16,
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            sizeH10,
            roundedRectBorderWidget(
              onTap: ()async{
                String? imagePath = await driverImageController.captureImage(ImageSource.gallery);
                setState(() {
                  drivingLicenceImagePath = imagePath;
                });
              },
              imageData: drivingLicenceImagePath == null
                  ? Icon(
                Icons.add_a_photo_outlined,
                size: 30,
                color: grey.shade400,
              )
                  : Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(
                      File(drivingLicenceImagePath),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            sizeH10,
            _addImage(
              onTap: ()async{
                String? imagePath = await driverImageController.captureImage(ImageSource.gallery);
                setState(() {
                  nidFrontImagePath = imagePath;
                });
              },
              titleText: 'এনআইডি সামনের ছবি',
              imageData: nidFrontImagePath == null
                  ? Icon(
                Icons.add_a_photo_outlined,
                size: 30,
                color: grey.shade400,
              )
                  : Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(
                      File(nidFrontImagePath),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            sizeH20,
            _addImage(
              onTap: ()async{
                String? imagePath = await driverImageController.captureImage(ImageSource.gallery);
                setState(() {
                  nidBackImagePath = imagePath;
                });
              },
              titleText: 'এনআইডি পিছনের ছবি',
              imageData: nidBackImagePath == null
                  ? Icon(
                Icons.add_a_photo_outlined,
                size: 30,
                color: grey.shade400,
              )
                  : Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(
                      File(nidBackImagePath),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            sizeH40,
            primaryButton(
              buttonName: 'নতুন ড্রাইভার যোগ করুন',
              onTap: () => Get.to(() => DashboardView(),transition: Transition.circularReveal),
            ),
            sizeH20,
          ],
        ),
      ),
    );
  }

  Widget roundedRectBorderWidget(
      {void Function()? onTap, required Widget imageData}) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: grey.shade300,
        dashPattern: [5, 3],
        radius: Radius.circular(10),
        // padding: EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          child: Container(height: 100, width: Get.width, child: imageData),
        ),
      ),
    );
  }

  Widget _addImage({
    required String? titleText,
    required Function()? onTap,
    required Widget imageData,
  }) {
    return Column(
      children: [
        Row(
          children: [
            KText(
              text: titleText,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        sizeH10,
        roundedRectBorderWidget(onTap: onTap, imageData: imageData),
      ],
    );
  }
}

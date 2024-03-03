import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/pages/allGari/controller/add_gari_controller.dart';
import 'package:druto_seba_driver/src/pages/home/bottomBarHome.dart';
import 'package:druto_seba_driver/src/widgets/button/primaryButton.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddNewGari1Page extends StatefulWidget {
  @override
  State<AddNewGari1Page> createState() => _AddNewGari1PageState();
}

class _AddNewGari1PageState extends State<AddNewGari1Page> {
  String airCondition = 'এসি';
  String selectedNidOrLicense = 'এনআইডি';

  final AddGariController addGariController = Get.put(AddGariController());

  var selectedCar = RxString('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: KText(
      //     text: 'নতুন গাড়ি যোগ করুন',
      //     fontSize: 20,
      //     color: white,
      //   ),
      // ),
      body: Obx(() => Padding(
        padding: paddingH20,
        child: ListView(
          children: [
            sizeH20,

            _addImage(
              onTap: (){
                addGariController.pickImage(ImageSource.gallery);
              },
              titleText: 'গাড়ির সামনের ছবি',
              imageData: addGariController.imagePath.isEmpty?  Icon(
                Icons.add_a_photo_outlined,
                size: 30,
                color: grey.shade400,
              ):  Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(
                      File(addGariController.imagePath.value),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            selectedCar.value == 'Truck' ? sizeW10 : sizeH20,
            selectedCar.value == 'Truck'
                ? sizeW10
                : _addImage(
              titleText: 'গাড়ির ভিতরে ছবি',
              imageData: Icon(
              Icons.add_a_photo_outlined,
              size: 30,
              color: grey.shade400,
            ),
            ),
            sizeH20,
            _addImage(
              titleText: 'নম্বর প্লেট সহ গাড়ির পিছনের ছবি',
              imageData: Icon(
                Icons.add_a_photo_outlined,
                size: 30,
                color: grey.shade400,
              ),
            ),
            sizeH20,
            _addImage(
              titleText: 'রেজিস্ট্রেশন পেপার ছবি',
              imageData: Icon(
                Icons.add_a_photo_outlined,
                size: 30,
                color: grey.shade400,
              ),
            ),
            sizeH10,
            Divider(),
            sizeH10,
            _addImage(
              titleText: 'বাস, ট্রাক রুট পারমিটের কাগজ',
              rigthSideText: ' (অপশনাল)',
              textSize: 12,
              imageData: Icon(
                Icons.add_a_photo_outlined,
                size: 30,
                color: grey.shade400,
              ),
            ),
            sizeH20,
            _addImage(
              titleText: 'ফিটনেস পেপার ছবি',
              rigthSideText: ' (অপশনাল)',
              textSize: 12,
              imageData: Icon(
                Icons.add_a_photo_outlined,
                size: 30,
                color: grey.shade400,
              ),
            ),
            sizeH20,
            _addImage(
              titleText: 'ট্যাক্স টোকেন পেপার ছবি',
              rigthSideText: ' (অপশনাল)',
              textSize: 12,
              imageData: Icon(
                Icons.add_a_photo_outlined,
                size: 30,
                color: grey.shade400,
              ),
            ),
            sizeH20,
            _addImage(
              titleText: 'ইন্সুরেন্স পেপার ছবি',
              rigthSideText: ' (অপশনাল)',
              textSize: 12,
              imageData: Icon(
                Icons.add_a_photo_outlined,
                size: 30,
                color: grey.shade400,
              ),
            ),
            // sizeH10,
            // Divider(),
            sizeH20,
            _addImage(
              titleText: 'ড্রাইভিং লাইসেন্স সামনের ছবি',
              imageData: Icon(
                Icons.add_a_photo_outlined,
                size: 30,
                color: grey.shade400,
              ),
            ),
            sizeH20,
            _addImage(
              titleText: 'ড্রাইভিং লাইসেন্স পিছনের ছবি',
              imageData: Icon(
                Icons.add_a_photo_outlined,
                size: 30,
                color: grey.shade400,
              ),
            ),
            sizeH40,
            primaryButton(
              height: 45,
              buttonName: 'গাড়ির তথ্য সেভ করুন',
              fontSize: 14,
              onTap: () => Get.to(() => BottombarHome()),
            ),
            sizeH30,
          ],
        ),
      ),)
    );
  }

  Widget _addImage({
    required String? titleText,
    void Function()? onTap,
    String? rigthSideText,
    double? textSize,
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
            KText(
              text: rigthSideText ?? ' *',
              fontSize: textSize ?? 16,
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        sizeH10,
        roundedRectBorderWidget(onTap: onTap, imageData: imageData ),
      ],
    );
  }

  Widget roundedRectBorderWidget({void Function()? onTap, required Widget imageData}) {
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
          child: Container(
            height: 100,
            width: Get.width,
            child: imageData
          ),
        ),
      ),
    );
  }
}

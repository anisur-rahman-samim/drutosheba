import 'dart:io';

import 'package:druto_seba_driver/src/modules/auth/controller/image_controller.dart';
import 'package:druto_seba_driver/src/modules/auth/controller/profile_create_controller.dart';
import 'package:druto_seba_driver/src/modules/auth/model/divisions_model.dart';
import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:druto_seba_driver/src/widgets/button/primaryButton.dart';
import 'package:druto_seba_driver/src/widgets/formField/customFormField.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../configs/appColors.dart';
import '../../../configs/appUtils.dart';
import '../../../widgets/formField/dropDownForm.dart';
import '../../../widgets/text/kText.dart';
import '../../dashboard/dashboard.dart';

class RegisterUserInfoPage extends StatefulWidget {
  @override
  State<RegisterUserInfoPage> createState() => _RegisterUserInfoPageState();
}

class _RegisterUserInfoPageState extends State<RegisterUserInfoPage> {
  final ImageController imageController = Get.put(ImageController());
  final ProfileCreateController profileCreateController = Get.put(ProfileCreateController());

  String nidSelected = 'এনআইডি';
  String gender = 'পুরুষ';
  var profileImagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: KText(
        text: 'নতুন একাউন্ট তৈরী',
        fontSize: 18,
        color: white,
      ),centerTitle: true,),
      body: Padding(
        padding: paddingH20,
        child: ListView(
          children: [
            sizeH20,
            profileImagePath != null? Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: grey.shade200,
                    child: ClipOval(
                      child: Container(
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          image: DecorationImage(
                            image: FileImage(
                              File(profileImagePath),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 50,
                    child: InkWell(
                      onTap: ()async{
                        String? imagePath = await imageController.captureImage(ImageSource.gallery);
                        setState(() {
                          profileImagePath = imagePath;
                        });
                      },
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: black,
                        child: Center(
                          child: Icon(Icons.camera_alt,color: white,size: 14,),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ) : InkWell(
              onTap: ()async{
                String? imagePath = await imageController.captureImage(ImageSource.gallery);
                setState(() {
                  profileImagePath = imagePath;
                });
              },
              child: CircleAvatar(
                radius: 40,
                backgroundColor: grey.shade200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: blue,
                      size: 15,
                    ),
                    KText(
                      text: 'ছবি যোগ করুন',
                      color: blue,
                      fontSize: 10,
                    ),
                  ],
                ),
              ),
            ),
            sizeH20,
            customFormField(
              hintText: 'নাম *',
              outlineColor: grey.shade200,
              height: 45,
            ),
            sizeH20,
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      nidSelected = 'এনআইডি';
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: nidSelected == 'এনআইডি'
                            ? primaryColor
                            : grey.shade200,
                      ),
                      color: nidSelected == 'এনআইডি' ? primaryColor : null,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: KText(
                        text: 'এনআইডি',
                        fontSize: 14,
                        color: nidSelected == 'এনআইডি' ? white : primaryColor,
                      ),
                    ),
                  ),
                ),
                sizeW20,
                GestureDetector(
                  onTap: () {
                    setState(() {
                      nidSelected = 'পাসপোর্ট';
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      color: nidSelected == 'পাসপোর্ট' ? primaryColor : null,
                      border: Border.all(
                        color: nidSelected == 'পাসপোর্ট'
                            ? primaryColor
                            : grey.shade200,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: KText(
                        text: 'পাসপোর্ট',
                        fontSize: 14,
                        color: nidSelected == 'পাসপোর্ট' ? white : primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            sizeH20,
            customFormField(
              hintText: 'এনআইডি নম্বর *',
              outlineColor: grey.shade200,
              height: 45,
            ),
            sizeH20,
            customFormField(
              hintText: 'ইমেইল',
              outlineColor: grey.shade200,
              height: 45,
            ),
            sizeH20,
            /*dropDownForm(
              hintText: 'বিভাগ *',
              title: '',
              requiredText: '',
              onTap: () {},
            ),*/
          Obx(
                () => SizedBox(
                  height: 55,
                  child: DropdownButtonFormField<Datum>(
                                value: null, // Set initial value if needed
                                items: profileCreateController.divisionsList.map((datum) {
                  return DropdownMenuItem<Datum>(
                    value: datum,
                    child: Text(datum.name!,style: TextStyle(
                      color: black54,
                      fontSize: 14,
                    ),),
                  );
                                }).toList(),
                                onChanged: (Datum? newValue) {
                                print('Selected Division ID: ${newValue!.id}');
                                },
                                decoration: InputDecoration(
                                 // labelText: 'Select Division',
                                   border: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.red.shade400)),
                                ),
                              ),
                ),
          ),
            /*FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    label: const Text("বিভাগ *"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: profileCreateController.selectedDivisions.value,
                      isDense: true,
                      onChanged: (String? newValue) {

                        setState(() {
                          profileCreateController
                              .changedDivisionsValue(newValue!);
                         // widget.categoriesController.printIdByNameIndex(widget.categoriesController.categoryIdList, widget.categoriesController.categoryList, newValue);

                        });
                      },
                      items: profileCreateController.divisionsList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),*/
            sizeH20,
            customFormField(
              hintText: 'ঠিকানা',
              outlineColor: grey.shade200,
              height: 45,
            ),
            sizeH20,
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = 'পুরুষ';
                      });
                    },
                    child: Container(
                      height: 35,
                      width: Get.width / 2.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              gender == 'পুরুষ' ? primaryColor : grey.shade200,
                        ),
                        color: gender == 'পুরুষ' ? primaryColor : null,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: KText(
                          text: 'পুরুষ',
                          fontSize: 14,
                          color: gender == 'পুরুষ' ? white : primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                sizeW10,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = 'মহিলা';
                      });
                    },
                    child: Container(
                      height: 35,
                      width: Get.width / 2.3,
                      decoration: BoxDecoration(
                        color: gender == 'মহিলা' ? primaryColor : null,
                        border: Border.all(
                          color:
                              gender == 'মহিলা' ? primaryColor : grey.shade200,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: KText(
                          text: 'মহিলা',
                          fontSize: 14,
                          color: gender == 'মহিলা' ? white : primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            sizeH20,
            customFormField(
              hintText: 'রেফারেল কোড',
              outlineColor: grey.shade200,
              height: 45,
            ),
            sizeH20,
            customFormField(
              hintText: 'পাসওয়ার্ড *',
              outlineColor: grey.shade200,
              height: 45,
            ),
            sizeH20,
            customFormField(
              hintText: 'পাসওয়ার্ড নিশ্চিত করুন *',
              outlineColor: grey.shade200,
              height: 45,
            ),
            sizeH20,
            primaryButton(
              buttonName: 'নিবন্ধন',
              onTap: () => Get.to(() => DashboardView(),transition: Transition.circularReveal),
            ),
            sizeH20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                KText(
                  text: 'নিবন্ধন করে আপনি আমাদের',
                  fontSize: 14,
                  color: black54,
                ),
                sizeW5,
                KText(
                  text: 'শর্তাবলী ও গোপনীয়তা',
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                  color: blue,
                ),
              ],
            ),
            Center(
              child: KText(
                text: 'নীতিতে সম্মত হচ্ছেন',
                fontSize: 14,
                color: black54,
              ),
            ),
            sizeH30,
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:druto_seba_driver/src/modules/auth/controller/image_controller.dart';
import 'package:druto_seba_driver/src/modules/auth/controller/profile_create_controller.dart';
import 'package:druto_seba_driver/src/modules/auth/model/divisions_model.dart';
import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:druto_seba_driver/src/widgets/button/primaryButton.dart';
import 'package:druto_seba_driver/src/widgets/formField/customFormField.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../configs/appColors.dart';
import '../../../configs/appUtils.dart';
import '../../../widgets/formField/dropDownForm.dart';
import '../../../widgets/snack_bar/snack_bar.dart';
import '../../../widgets/text/kText.dart';
import '../../dashboard/dashboard.dart';

class RegisterUserInfoPage extends StatefulWidget {
  final String number;

  const RegisterUserInfoPage({super.key, required this.number});
  @override
  State<RegisterUserInfoPage> createState() => _RegisterUserInfoPageState();
}

class _RegisterUserInfoPageState extends State<RegisterUserInfoPage> {
  final ImageController imageController = Get.put(ImageController());
  final ProfileCreateController profileCreateController =
      Get.put(ProfileCreateController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController refCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  String nidSelected = 'এনআইডি';
  String gender = 'পুরুষ';
  var profileImagePath;
  var divisionId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'নতুন একাউন্ট তৈরী',
          fontSize: 18,
          color: white,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: paddingH20,
        child: ListView(
          children: [
            sizeH20,
            profileImagePath != null
                ? Center(
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
                            onTap: () async {
                              String? imagePath = await imageController
                                  .captureImage(ImageSource.gallery);
                              setState(() {
                                profileImagePath = imagePath;
                              });
                            },
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: black,
                              child: Center(
                                child: Icon(
                                  Icons.camera_alt,
                                  color: white,
                                  size: 14,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () async {
                      String? imagePath = await imageController
                          .captureImage(ImageSource.gallery);
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
              controller: nameController,
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
              controller: idController,
              hintText: 'এনআইডি নম্বর *',
              outlineColor: grey.shade200,
              height: 45,
            ),
            sizeH20,
            customFormField(
              controller: emailController,
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
                height: 45,
                child: DropdownButtonFormField<Datum>(
                  value: profileCreateController.divisionsList.isNotEmpty
                      ? profileCreateController.divisionsList[0]
                      : null,
                  items: profileCreateController.divisionsList.map((datum) {
                    return DropdownMenuItem<Datum>(
                      value: datum,
                      child: Text(
                        datum.name!,
                        style: TextStyle(
                          color: black54,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (Datum? newValue) {
                   setState(() {
                     divisionId = newValue!.name;
                   });
                    print('Selected $divisionId Division ID: ${newValue!.id}');
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 14),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: grey.shade200)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: grey.shade200)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: grey.shade200)),
                  ),
                ),
              ),
            ),
            sizeH20,
            customFormField(
              controller: addressController,
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
              controller: refCodeController,
              hintText: 'রেফারেল কোড',
              outlineColor: grey.shade200,
              height: 45,
            ),
            sizeH20,
            customFormField(
              controller: passwordController,
              hintText: 'পাসওয়ার্ড *',
              outlineColor: grey.shade200,
              height: 45,
            ),
            sizeH20,
            customFormField(
              controller: rePasswordController,
              hintText: 'পাসওয়ার্ড নিশ্চিত করুন *',
              outlineColor: grey.shade200,
              height: 45,
            ),
            sizeH20,
            Obx(() => profileCreateController.isLoading.value == true? primaryButton(
                child: CustomLoader(color: white,size: 30,), buttonName: '', onTap: () {  }
            ): primaryButton(
                buttonName: 'নিবন্ধন',
                onTap: () {
                  if(passwordController.text == rePasswordController.text){
                    profileCreateController.profileCreate(
                        name: nameController.text,
                        phone: widget.number,
                        email: emailController.text,
                        gender: gender,
                        address: addressController.text,
                        docType: nidSelected,
                        docNumber: idController.text,
                        image: profileImagePath,
                        password: passwordController.text,
                        referCode: refCodeController.text,
                        division: divisionId.toString());
                  }else{
                    kSnackBar(message: "Password not match", bgColor: Colors.red);
                  }

                }
            ),),
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

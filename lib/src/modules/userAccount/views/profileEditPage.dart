import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:druto_seba_driver/src/modules/userAccount/controller/profile_controller.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/button/primaryButton.dart';
import 'package:druto_seba_driver/src/widgets/formField/requiredForm.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../configs/appColors.dart';
import '../../../configs/appUtils.dart';
import '../../../widgets/text/kText.dart';
import '../../dashboard/dashboard.dart';
import '../controller/profile_edit_controller.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final ProfileEditController profileEditController =
      Get.put(ProfileEditController());
  final ProfileController profileController = Get.put(ProfileController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController nidController = TextEditingController();
  final TextEditingController divisionController = TextEditingController();

  @override
  void initState() {
    nameController.text = profileController.profileModel.value.data!.name.toString();
    emailController.text = profileController.profileModel.value.data!.email.toString();
    addressController.text = profileController.profileModel.value.data!.address.toString();
    nidController.text = profileController.profileModel.value.data!.docNumber.toString();
    divisionController.text = profileController.profileModel.value.data!.division.toString();
    setState(() {
      gender = profileController.profileModel.value.data!.gender.toString();
      selectedValidation = profileController.profileModel.value.data!.docType.toString();
    });
    super.initState();
  }

  String selectedValidation = 'এনআইডি';
  String gender = 'পুরুষ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: black),
        title: KText(
          text: 'প্রোফাইল এডিট',
          fontSize: 20,
        ),
        backgroundColor: white,
      ),
      body: Obx(() => Padding(
        padding: paddingH20,
        child: ListView(
          children: [
            sizeH10,
            // ClipOval(
            //   child: Image.asset(
            //     'assets/img/profile.png',
            //     height: 100,
            //     width: 100,
            //   ),
            // ),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                profileEditController.imagePath.isEmpty
                    ? Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        Api.getImageURL(profileController.profileModel.value.data!.image.toString(),)
                     ),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                    :
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: FileImage(
                        File(profileEditController.imagePath.value),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 120,
                  bottom: -10,
                  child: IconButton(
                    onPressed: () {
                      profileEditController.pickImage(ImageSource.gallery);
                    },
                    icon: CircleAvatar(
                      radius: 13,
                      backgroundColor: grey.shade300,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: white,
                        child: Icon(
                          Icons.edit,
                          size: 15,
                          color: blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            sizeH10,
            requiredForm(
              controller: nameController,
              title: 'সম্পূর্ণ নাম (এনআইডি এর মতো)',
              labelText: 'সম্পূর্ণ নাম (এনআইডি এর মতো)',
              requiredText: '*',
            ),
            // sizeH10,
            // requiredForm(
            //   title: 'যোগাযোগ নম্বর',
            //   labelText: 'যোগাযোগ নম্বর',
            //   requiredText: '',
            // ),
            sizeH10,
            Row(
              children: [
                Expanded(
                  child: primaryButton(
                      height: 40,
                      buttonName: 'এনআইডি',
                      color: selectedValidation == 'এনআইডি' ? null : white,
                      borderColor: selectedValidation == 'এনআইডি' ? null : grey,
                      textColor:
                      selectedValidation == 'এনআইডি' ? white : primaryColor,
                      onTap: () {
                        setState(() {
                          selectedValidation = 'এনআইডি';
                        });
                      }),
                ),
                sizeW10,
                Expanded(
                  child: primaryButton(
                      height: 40,
                      buttonName: 'পাসপোর্ট',
                      borderColor:
                      selectedValidation == 'পাসপোর্ট' ? null : grey,
                      textColor: selectedValidation == 'পাসপোর্ট'
                          ? white
                          : primaryColor,
                      color: selectedValidation == 'পাসপোর্ট' ? null : white,
                      onTap: () {
                        setState(() {
                          selectedValidation = 'পাসপোর্ট';
                        });
                      }),
                ),
                Expanded(child: Container()),
              ],
            ),
            sizeH10,
            requiredForm(
              controller: nidController,
              title: '$selectedValidation নম্বর',
              labelText: '$selectedValidation নম্বর',
              requiredText: '',
            ),
            sizeH10,
            requiredForm(
              controller: emailController,
              title: 'ইমেইল',
              labelText: 'ইমেইল',
              requiredText: '*',
            ),
            sizeH10,
            requiredForm(
              controller: divisionController,
              title: 'বিভাগ',
              labelText: 'বিভাগ',
              requiredText: '*',
            ),
            sizeH10,
            requiredForm(
              controller: addressController,
              title: 'ঠিকানা',
              labelText: 'ঠিকানা',
              requiredText: '*',
            ),
            sizeH10,
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
                Expanded(
                  child: genderSelectButton(buttonName: 'পুরুষ'),
                ),
                sizeW5,
                Expanded(
                  child: genderSelectButton(buttonName: 'মহিলা'),
                ),
                sizeW5,
                Expanded(
                  child: genderSelectButton(buttonName: 'অন্যান্য'),
                ),
              ],
            ),
            sizeH20,
            profileEditController.isLoading.value == true? primaryButton(
                child: CustomLoader(color: white,size: 30,), buttonName: '', onTap: () {  }
            ) : primaryButton(
              buttonName: 'আপডেট করুন',
              onTap: () {
                profileEditController.profileUpdate(
                    name: nameController.text,
                    email: emailController.text,
                    gender: gender,
                    address: addressController.text,
                    doc_type: selectedValidation,
                    doc_number: nidController.text,
                    image: profileEditController.imagePath.value.isEmpty? null: profileEditController.imagePath.value,
                    division: divisionController.text);
              }
            ),
            sizeH20,
          ],
        ),
      ))
    );
  }

  Widget genderSelectButton({
    String? buttonName,
  }) {
    return primaryButton(
      height: 40,
      buttonName: '$buttonName',
      radius: 5,
      borderColor: gender == '$buttonName' ? primaryColor : grey,
      color: white,
      onTap: () {
        setState(() {
          gender = '$buttonName';
        });
      },
      child: Row(
        children: [
          Icon(
            gender == '$buttonName'
                ? Icons.check_circle
                : Icons.radio_button_off_outlined,
            color: gender == '$buttonName' ? primaryColor : grey,
          ),
          sizeW5,
          KText(
            text: '$buttonName',
            fontSize: 14,
            color: gender == '$buttonName' ? primaryColor : black54,
          ),
        ],
      ),
    );
  }

  Widget roundedRectBorderWidget() {
    return DottedBorder(
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
          child: Icon(
            Icons.add_a_photo_outlined,
            size: 30,
            color: grey.shade400,
          ),
        ),
      ),
    );
  }
}

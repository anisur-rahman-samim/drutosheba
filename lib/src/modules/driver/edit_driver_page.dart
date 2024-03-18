import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/modules/driver/controller/driver_controller.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/formField/requiredForm.dart';

import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../configs/appColors.dart';
import '../../widgets/button/primaryButton.dart';
import '../../widgets/text/kText.dart';
import '../dashboard/dashboard.dart';
import 'controller/driver_image_controller.dart';
import 'model/driver_model.dart';

class EditDriverPage extends StatefulWidget {
  final Datum driver;

  const EditDriverPage({super.key, required this.driver});
  @override
  State<EditDriverPage> createState() => _EditDriverPageState();
}

class _EditDriverPageState extends State<EditDriverPage> {
  String gender = 'পুরুষ';
  final DriverImageController driverImageController =
  Get.put(DriverImageController());

  final DriverController driverController = Get.put(DriverController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController drivingNoController = TextEditingController();

  var profileImagePath;
  var drivingLicenceImagePath;
  var nidFrontImagePath ;
  var nidBackImagePath ;

  @override
  void initState() {
    nameController.text = widget.driver.name.toString();
    phoneController.text = widget.driver.phone.toString();
    contactController.text = widget.driver.contactNo.toString();
    emailController.text = widget.driver.email.toString();
    addressController.text = widget.driver.address.toString();
    drivingNoController.text = widget.driver.drivingNo.toString();
    gender = widget.driver.gender.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'ড্রাইভার এডিট করুন',
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
                          image: NetworkImage(
                            Api.getImageURL(widget.driver.image.toString())
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
              controller: nameController,
              title: 'নাম',
              hintText: 'নাম লিখুন',
              requiredText: '*',
            ),
            sizeH20,
            requiredForm(
              controller: phoneController,
              title: 'মোবাইল নম্বর',
              hintText: 'মোবাইল নম্বর লিখুন',
              requiredText: '*',
            ),
            sizeH20,
            requiredForm(
              controller: contactController,
              title: 'যোগাযোগ নম্বর',
              hintText: 'যোগাযোগ নম্বর লিখুন',
              requiredText: '*',
            ),
            sizeH20,
            requiredForm(
              controller: emailController,
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
            requiredForm(
              controller: addressController,
              title: 'ঠিকানা',
              hintText: 'ঠিকানা লিখুন',
              requiredText: '*',
            ),
            sizeH20,
            requiredForm(
              controller: drivingNoController,
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
                  ? Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        Api.getImageURL(widget.driver.drivingImage.toString())
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
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
                  ? Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        Api.getImageURL(widget.driver.nidFront.toString())
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
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
                  ? Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        Api.getImageURL(widget.driver.nidBack.toString())
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
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
            Obx(() => driverController.isLoading.value == true? primaryButton(
                child: CustomLoader(color: white,size: 30,), buttonName: '', onTap: () {  }
            )  :
            primaryButton(
                buttonName: 'ড্রাইভার আপডেট করুন',
                onTap: () {
                  driverController.driverUpdate(
                      name: nameController.text,
                      phone: phoneController.text,
                      contactNo: contactController.text,
                      email: emailController.text,
                      drivingNo: drivingNoController.text,
                      address: addressController.text,
                      gender: gender,
                      drivingImage: drivingLicenceImagePath == null? null: drivingLicenceImagePath,
                      nidFront: nidFrontImagePath == null ? null: nidFrontImagePath,
                      nidBack: nidBackImagePath == null ? null : nidBackImagePath,
                      image: profileImagePath == null? null: profileImagePath,
                      driverId: widget.driver.id.toString()
                  );

                }
            ),),
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

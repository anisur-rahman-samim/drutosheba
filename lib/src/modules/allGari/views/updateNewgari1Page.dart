import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/modules/allGari/controller/vehicles_save_controller.dart';
import 'package:druto_seba_driver/src/modules/allGari/model/vehicles_model.dart';
import 'package:druto_seba_driver/src/modules/dashboard/dashboard.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';

import 'package:druto_seba_driver/src/widgets/button/primaryButton.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/gari_image_controller.dart';

class UpdateNewGari1Page extends StatefulWidget {
  final Vehicles? vehicles;
  final String carName;
  final String fualName;
  final String brandName;
  final String metroName;
  final String subMetroName;
  final String metroNumber;
  final String modelName;
  final String modelYear;
  final String colorName;
  final String airCondition;

  const UpdateNewGari1Page({super.key, required this.carName, required this.fualName, required this.brandName, required this.metroName, required this.subMetroName, required this.metroNumber, required this.modelName, required this.modelYear, required this.colorName, required this.airCondition, this.vehicles});

  @override
  State<UpdateNewGari1Page> createState() => _UpdateNewGari1PageState();
}

class _UpdateNewGari1PageState extends State<UpdateNewGari1Page> {
   final VehiclesSaveController vehiclesSaveController = Get.put(VehiclesSaveController());
  String airCondition = 'এসি';
  String selectedNidOrLicense = 'এনআইডি';

  var carFrontImage;
  var carBackImage;
  var numberPlatImage;
  var regPapersImage;
  var rootPermitImage;
  var fitnessPapersImage;
  var texTokenImage;
  var insuranceImage;
  var drivingLicenceFront;
  var drivingLicenceBack;

  final GariImageController addGariController = Get.put(GariImageController());

  var selectedCar = RxString('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Padding(
        padding: paddingH20,
        child: ListView(
          children: [
            sizeH20,

            _addImage(
              onTap: ()async{
                String? imagePath = await addGariController.captureImage(ImageSource.gallery);
                 setState(() {
                   carFrontImage = imagePath;
                 });
              },
              titleText: 'গাড়ির সামনের ছবি',
              imageData: carFrontImage == null?  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        Api.getImageURL(widget.vehicles!.vehicleFrontPic)
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ):  Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(
                      File(carFrontImage),
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
              onTap: ()async{
                String? imagePath = await addGariController.captureImage(ImageSource.gallery);
                setState(() {
                  carBackImage = imagePath;
                });
              },
              titleText: 'গাড়ির ভিতরে ছবি',
              imageData: carBackImage == null?  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        Api.getImageURL(widget.vehicles!.vehicleBackPic)
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ):  Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(
                      File(carBackImage),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            sizeH20,
            _addImage(
              onTap: ()async{
                String? imagePath = await addGariController.captureImage(ImageSource.gallery);
                setState(() {
                  numberPlatImage = imagePath;
                });
              },
              titleText: 'নম্বর প্লেট সহ গাড়ির পিছনের ছবি',
              imageData: numberPlatImage == null?  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        Api.getImageURL(widget.vehicles!.vehiclePlateNo)
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ):  Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(
                      File(numberPlatImage),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            sizeH20,
            _addImage(
              onTap: ()async{
                String? imagePath = await addGariController.captureImage(ImageSource.gallery);
                setState(() {
                  regPapersImage = imagePath;
                });
              },
              titleText: 'রেজিস্ট্রেশন পেপার ছবি',
              imageData: regPapersImage == null?  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        Api.getImageURL(widget.vehicles!.vehicleRegPic)
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ):  Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(
                      File(regPapersImage),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            sizeH10,
            Divider(),
            sizeH10,
            _addImage(
              onTap: ()async{
                String? imagePath = await addGariController.captureImage(ImageSource.gallery);
                setState(() {
                  rootPermitImage = imagePath;
                });
              },
              titleText: 'বাস, ট্রাক রুট পারমিটের কাগজ',
              rigthSideText: ' (অপশনাল)',
              textSize: 12,
              imageData: rootPermitImage == null?  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        Api.getImageURL(widget.vehicles!.vehicleRootPic)
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ):  Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(
                      File(rootPermitImage),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            sizeH20,
            _addImage(
              onTap: ()async{
                String? imagePath = await addGariController.captureImage(ImageSource.gallery);
                setState(() {
                  fitnessPapersImage = imagePath;
                });
              },
              titleText: 'ফিটনেস পেপার ছবি',
              rigthSideText: ' (অপশনাল)',
              textSize: 12,
              imageData: fitnessPapersImage == null?  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        Api.getImageURL(widget.vehicles!.vehicleFitnessPic)
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ):  Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(
                      File(fitnessPapersImage),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            sizeH20,
            _addImage(
              onTap: ()async{
                String? imagePath = await addGariController.captureImage(ImageSource.gallery);
                setState(() {
                  texTokenImage = imagePath;
                });
              },
              titleText: 'ট্যাক্স টোকেন পেপার ছবি',
              rigthSideText: ' (অপশনাল)',
              textSize: 12,
              imageData: texTokenImage == null?  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        Api.getImageURL(widget.vehicles!.vehicleTaxPic)
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ):  Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(
                      File(texTokenImage),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            sizeH20,
            _addImage(
              onTap: ()async{
                String? imagePath = await addGariController.captureImage(ImageSource.gallery);
                setState(() {
                  insuranceImage = imagePath;
                });
              },
              titleText: 'ইন্সুরেন্স পেপার ছবি',
              rigthSideText: ' (অপশনাল)',
              textSize: 12,
              imageData: insuranceImage == null?  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        Api.getImageURL(widget.vehicles!.vehicleInsurancePic)
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ):  Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(
                      File(insuranceImage),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // sizeH10,
            // Divider(),
            sizeH20,
            _addImage(
              onTap: ()async{
                String? imagePath = await addGariController.captureImage(ImageSource.gallery);
                setState(() {
                  drivingLicenceFront = imagePath;
                });
              },
              titleText: 'ড্রাইভিং লাইসেন্স সামনের ছবি',
              imageData: drivingLicenceFront == null?  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        Api.getImageURL(widget.vehicles!.vehicleDrivingFront)
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ):  Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(
                      File(drivingLicenceFront),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            sizeH20,
            _addImage(
              onTap: ()async{
                String? imagePath = await addGariController.captureImage(ImageSource.gallery);
                setState(() {
                  drivingLicenceBack = imagePath;
                });
              },
              titleText: 'ড্রাইভিং লাইসেন্স পিছনের ছবি',
              imageData: drivingLicenceBack == null?  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        Api.getImageURL(widget.vehicles!.vehicleDrivingBack)
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ):  Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(
                      File(drivingLicenceBack),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
              sizeH40,
            vehiclesSaveController.isLoading.value == true? primaryButton(
                child: CustomLoader(color: white,size: 30,), buttonName: '', onTap: () {  }
            ): primaryButton(
              height: 45,
              buttonName: 'গাড়ির তথ্য আপডেট করুন',
              fontSize: 14,
              onTap: () {
                vehiclesSaveController.vehiclesUpdate(
                    brand: widget.carName,
                    metro: widget.metroName,
                    metroType: widget.subMetroName,
                    metroNo: widget.metroNumber,
                    model: widget.modelName,
                    modelYear: widget.modelYear,
                    vehicleColor: widget.colorName,
                    aircondition: widget.airCondition,
                    fuel_type: widget.fualName,
                    brand_name: widget.brandName,


                    vehicle_front_pic: carFrontImage == null? null: carFrontImage,
                    vehicle_back_pic: carBackImage == null? null: carBackImage,
                    vehicle_reg_pic: regPapersImage == null? null: regPapersImage,
                    vehicle_plate_no: numberPlatImage == null? null: numberPlatImage,
                    vehicle_root_pic: rootPermitImage  == null? null: rootPermitImage,
                    vehicle_fitness_pic: fitnessPapersImage   == null? null: fitnessPapersImage,
                    vehicle_tax_pic: texTokenImage   == null? null: texTokenImage,
                    vehicle_insurance_pic: insuranceImage  == null? null: insuranceImage,
                    vehicle_driving_front: drivingLicenceFront  == null? null: drivingLicenceFront,
                    vehicle_driving_back: drivingLicenceBack == null? null: drivingLicenceBack,
                    carId: widget.vehicles!.id.toString()
                );
              },
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

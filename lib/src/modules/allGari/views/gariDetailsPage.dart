import 'package:druto_seba_driver/src/modules/allGari/controller/metro_controller.dart';
import 'package:druto_seba_driver/src/modules/allGari/model/vehicles_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../configs/appColors.dart';
import '../../../configs/appUtils.dart';
import '../../../widgets/card/customCardWidget.dart';
import '../../../widgets/text/kText.dart';
import 'addNewGariPage.dart';

class GariDetailsPage extends StatelessWidget {
  final Vehicles vehicles;
   GariDetailsPage({Key? key, required this.vehicles}) : super(key: key);
  
  final MetroController metroController = Get.put(MetroController());
  
  @override
  Widget build(BuildContext context) {
    String dateTimeString = vehicles.createdAt.toString();
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDate = DateFormat('dd MMM, yyyy').format(dateTime);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
        title: KText(
          text: 'গাড়ির বিস্তারিত',
          fontSize: 18,
        ),
      ),
      backgroundColor: grey.shade100,
      body: ListView(
        children: [
          sizeH10,
          CustomCardWidget(
            onTap: null,
            radius: 0,
            elevation: 0,
            child: Padding(
              padding: paddingH10,
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/img/car1.png',
                        height: 50,
                        width: 40,
                      ),
                      sizeW10,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: Get.width / 1.47,
                                child: Row(
                                  children: [
                                    KText(
                                      text: vehicles.getbrand?.name,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    sizeW5,
                                    vehicles.status == "pending"?
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.orange.shade400,
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 7,
                                          vertical: 3,
                                        ),
                                        child: Center(
                                          child: KText(
                                            text:  'অ্যাপ্রুভ হয়নি',
                                            fontSize: 9,
                                            color: white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ):
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade400,
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 7,
                                          vertical: 3,
                                        ),
                                        child: Center(
                                          child: KText(
                                            text:  'অ্যাপ্রুভ',
                                            fontSize: 9,
                                            color: white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () => Get.to(() => AddNewGariPage(
                                  isEditPage: true,
                                ),transition: Transition.circularReveal),
                                borderRadius: BorderRadius.circular(30),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: blue.withOpacity(.2),
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Icon(
                                      Icons.edit,
                                      color: blue,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              KText(
                                text: 'যোগদানের তারিখ: ',
                                fontSize: 12,
                                color: black54,
                                fontWeight: FontWeight.w600,
                              ),
                              sizeW5,
                              KText(
                                text: formattedDate,
                                fontSize: 12,
                                color: black54,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  sizeH10,
                  rawText(
                    title: 'ব্র্যান্ড এর নাম',
                    content: vehicles.getbrand?.name,
                  ),
                  rawText(
                    title: 'মডেল',
                    content: vehicles.model,
                  ),
                  rawText(
                    title: 'বছর',
                    content: vehicles.modelYear,
                  ),
                  rawText(
                    title: 'রেজিস্ট্রেশন নম্বর',
                    content: '${vehicles.metro}-${vehicles.metroType}-${vehicles.metroNo}',
                  ),
                  rawText(
                    title: 'আসন',
                    content: vehicles.getbrand?.capacity,
                  ),
                  rawText(
                    title: 'এয়ার কন্ডিশন',
                    content: vehicles.aircondition == "yes" ?'AC':'NonAC',
                  ),
                  rawText(
                    title: 'গাড়ির রং',
                    content: vehicles.vehicleColor,
                    isHideDivider: true,
                  ),
                ],
              ),
            ),
          ),
          sizeH10,
          CustomCardWidget(
            onTap: null,
            radius: 0,
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KText(
                  text: 'গাড়ির ছবি',
                  fontSize: 12,
                  color: black54,
                ),
                sizeH10,
               Image.network(Api.getImageURL(vehicles.vehicleFrontPic),height: 70,width: 70,fit: BoxFit.fill,),
              ],
            ),
          ),
          sizeH10,
          CustomCardWidget(
            onTap: null,
            radius: 0,
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KText(
                  text: 'রেজিস্ট্রেশন পেপার ছবি',
                  fontSize: 12,
                  color: black54,
                ),
                sizeH10,
                Row(
                  children: [

                    Image.network(Api.getImageURL(vehicles.vehicleFitnessPic),height: 70,width: 70,fit: BoxFit.fill,),
                    Image.network(Api.getImageURL(vehicles.vehicleInsurancePic),height: 70,width: 70,fit: BoxFit.fill,),
                    Image.network(Api.getImageURL(vehicles.vehicleDrivingFront),height: 70,width: 70,fit: BoxFit.fill,),
                    Image.network(Api.getImageURL(vehicles.vehicleDrivingBack),height: 70,width: 70,fit: BoxFit.fill,),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  rawText({
    required String? title,
    required String? content,
    bool? isHideDivider = false,
  }) {
    return Column(
      children: [
        Row(
          children: [
            KText(
              text: '$title',
              fontSize: 12,
              color: black54,
            ),
            Spacer(),
            KText(
              text: '$content',
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ],
        ),
        isHideDivider == true ? sizeW10 : sizeH5,
        isHideDivider == true ? sizeW10 : Divider(),
        isHideDivider == true ? sizeW10 : sizeH5,
      ],
    );
  }
}

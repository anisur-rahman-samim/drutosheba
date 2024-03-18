import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/dummyData/rentalData.dart';
import 'package:druto_seba_driver/src/modules/allGari/controller/vehicles_brand_controller.dart';
import 'package:druto_seba_driver/src/modules/allGari/views/addNewGariPage.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/loader/no_data.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/vehicles_controller.dart';
import 'gariDetailsPage.dart';

class GariListPage extends StatelessWidget {
  final VehiclesController vehiclesController = Get.put(VehiclesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
        title: KText(
          text: 'আপনার গাড়ি সমূহ',
          fontSize: 18,
        ),
      ),

      backgroundColor: grey.shade100,
      body: Obx(() => vehiclesController.isLoading.value == true? CustomLoader(color: black, size: 30): vehiclesController.vehiclesList.isEmpty? NoDataView() : Padding(
        padding: EdgeInsets.all(10),
        child:ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: vehiclesController.vehiclesList.length,
          itemBuilder: ((context, index) {
            final item = vehiclesController.vehiclesList[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: CustomCardWidget(
                onTap: () => Get.to(() => GariDetailsPage(vehicles: item,),transition: Transition.circularReveal),
                radius: 10,
                elevation: 0,
                child: Padding(
                  padding: paddingH10,
                  child: Row(
                    children: [
                      /*Image.network(
                        Api.getImageURL(item.vehicleFrontPic.toString(),),
                        height: 50,
                        width: 40,
                      ),*/
                      sizeW10,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: Get.width / 1.58,
                                child: Row(
                                  children: [
                                    KText(
                                      text: item.getbrand?.name.toString(),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    sizeW5,
                                    item.status == "pending"?
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
                             /* InkWell(
                                onTap: () => Get.to(() => AddNewGariPage(
                                  isEditPage: true,
                                ),transition: Transition.circularReveal),
                                borderRadius: BorderRadius.circular(30),
                                child: Padding(
                                  padding: paddingAll5,
                                  child: Icon(
                                    Icons.edit,
                                    color: blue,
                                    size: 20,
                                  ),
                                ),
                              ),*/
                            ],
                          ),
                          Row(
                            children: [
                              KText(
                                text: item.model,
                                fontSize: 12,
                                color: black54,
                                fontWeight: FontWeight.w600,
                              ),
                              sizeW5,
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: grey,
                              ),
                              sizeW5,
                              KText(
                                text: item.aircondition == "yes" ?'AC':'NonAC',
                                fontSize: 12,
                                color: black54,
                                fontWeight: FontWeight.w600,
                              ),
                              sizeW5,
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: grey,
                              ),
                              sizeW5,
                              KText(
                                text: '${item.getbrand?.capacity} Seats',
                                fontSize: 12,
                                color: black54,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          sizeH5,
                          Row(
                            children: [
                              KText(
                                text: '${item.metro}-${item.metroType.toString()}-${item.metroNo}',
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
                ),
              ),
            );
          }),
        ),
      ),),
      floatingActionButton: GestureDetector(
        onTap: () => Get.to(() => AddNewGariPage(),transition: Transition.circularReveal),
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: paddingH10V10,
            child: Icon(
              Icons.add,
              color: white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:druto_seba_driver/src/dummyData/rentalData.dart';
import 'package:druto_seba_driver/src/modules/allGari/controller/vehicles_brand_controller.dart';
import 'package:druto_seba_driver/src/modules/allGari/controller/vehicles_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/trip_request_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/tripRequestPage.dart';
import 'package:druto_seba_driver/src/widgets/bottomSheet/customBottomSheet.dart';
import 'package:druto_seba_driver/src/widgets/division_find/division_find.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../modules/auth/controller/profile_create_controller.dart';
import '../../widgets/card/customCardWidget.dart';

class FilterComponent extends StatefulWidget {
  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  final TripRequestController tripRequestController = Get.put(TripRequestController());
  final ProfileCreateController divisionController = Get.put(ProfileCreateController());
  final VehiclesBrandController vehiclesBrandController = Get.put(VehiclesBrandController());

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      height: 50,
      radius: 0,
      child: Container(
        color: white,
        alignment: Alignment.center,
        child: Row(
          children: [
            Spacer(),
            GestureDetector(
              onTap: () => all(context),
              child: Container(
                height: 50,
                width: 60,
                // color: primaryColor,
                child: Row(
                  children: [
                    KText(
                      text: 'All ',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    Icon(
                      Icons.filter_list,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
            sizeW5,
            GestureDetector(
              onTap: () => _allVehicles(context),
              child: Container(
                height: 50,
                width: 120,
                // color: primaryColor,
                child: Row(
                  children: [
                    KText(
                      text: 'All Vehicles ',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    Icon(
                      Ionicons.car,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _allVehicles(BuildContext context) {
    return customBottomSheet(
      context: context,
      height: Get.height / 2,
      child: Container(
        height: Get.height / 2.3,
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            Center(
              child: KText(
                text: 'গাড়ির ধরণ দ্বারা ফিল্টার',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizeH20,
            // Divider(),
            InkWell(
              onTap: () {
                setState(() {
                  tripRequestController.tripFilterCar.value = "All";
                });
                //   Get.to(() => TripRequestPage());
                vehiclesBrandController.getVehiclesBrand();
                Navigator.pop(context, true);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: KText(
                  text: "All",
                  fontSize: 18,
                ),
              ),
            ),
           Obx(() => vehiclesBrandController.isLoading.value == true? CustomLoader(color: black, size: 30) :   ListView.builder(
               shrinkWrap: true,
               primary: false,
               itemCount: vehiclesBrandController.vehiclesBrandList.length,
               itemBuilder: (c, i) {
                 final item = vehiclesBrandController.vehiclesBrandList[i];
                 return InkWell(
                   onTap: () {
                   setState(() {
                     tripRequestController.tripFilterCar.value = item.name.toString();
                   });
                  //   Get.to(() => TripRequestPage());
                   vehiclesBrandController.getVehiclesBrand();
                     Navigator.pop(context, true);
                   },
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Divider(),
                       Padding(
                         padding: EdgeInsets.symmetric(
                           horizontal: 10,
                           vertical: 5,
                         ),
                         child: KText(
                           text:
                           '${item.name} ( ${item.capacity})'.replaceAll(
                             'capacity',
                             '',
                           ),
                           fontSize: 18,
                         ),
                       ),
                     ],
                   ),
                 );
               }),)
          ],
        ),
      ),
    );
  }

  all(BuildContext context) {
    return customBottomSheet(
      context: context,
      height: Get.height / 2,
      child: Container(
        height: Get.height / 2.3,
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            Center(
              child: KText(
                text: 'বিভাগ দ্বারা ফিল্টার',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizeH20,
            // Divider(),
            InkWell(
              onTap: () {
                setState(() {
                  tripRequestController.tripFilter.value = "All";
                });
                print(tripRequestController.tripFilter.value);
                //  Get.to(() => TripRequestPage());
                tripRequestController.getTripResqust();
                Navigator.pop(context, true);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: KText(
                  text: "All",
                  fontSize: 18,
                ),
              ),
            ),
           Obx(() =>  divisionController.isLoading.value == true? CustomLoader(color: black, size: 30) : ListView.builder(
               shrinkWrap: true,
               primary: false,
               itemCount: divisionController.divisionsList.length,
               itemBuilder: (c, i) {
                 final item = divisionController.divisionsList[i];
                 return Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Divider(),
                     InkWell(
                       onTap: () {
                         setState(() {
                           tripRequestController.tripFilter.value = item.name.toString();
                         });
                         print(tripRequestController.tripFilter.value);
                       //  Get.to(() => TripRequestPage());
                         tripRequestController.getTripResqust();
                         Navigator.pop(context, true);
                       },
                       child: Padding(
                         padding: EdgeInsets.symmetric(
                           horizontal: 10,
                           vertical: 5,
                         ),
                         child: KText(
                           text: '${item.name}',
                           fontSize: 18,
                         ),
                       ),
                     ),
                   ],
                 );
               }),)
          ],
        ),
      ),
    );
  }
}


import 'package:druto_seba_driver/src/components/trip/trip_vivoroni_details.dart';
import 'package:druto_seba_driver/src/modules/allGari/controller/vehicles_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/distance_time_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/waiting_bid_trip_controller.dart';
import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/loader/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../modules/trip/controller/confirm_trip_controller.dart';
import '../../modules/trip/controller/confirmed_trip_controller.dart';
import '../../widgets/button/outlineButton.dart';
import '../../widgets/card/customCardWidget.dart';
import '../../widgets/dottedDivider/dotDivider.dart';
import '../../widgets/text/kText.dart';

class TripVivoroniComponent extends StatefulWidget {
  @override
  State<TripVivoroniComponent> createState() => _TripVivoroniComponentState();
}

class _TripVivoroniComponentState extends State<TripVivoroniComponent> {
  final ConfirmedTripController confirmTripController = Get.put(ConfirmedTripController());

  final VehiclesController vehiclesController = Get.put(VehiclesController());

  final DistanceTimeController distanceTimeController = Get.put(DistanceTimeController());

  @override
  void initState() {
    confirmTripController.getConfirmedTrip();
    vehiclesController.getVehicles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: 60),
        child: Padding(
            padding: paddingH10,
            child: Obx(() => confirmTripController.isLoading.value == true? CustomLoader(color: black, size: 30): confirmTripController.confirmTripList.isEmpty? Center(child: NoDataView()) : RefreshIndicator(
              onRefresh: ()async{
                await   confirmTripController.getConfirmedTrip();
                 vehiclesController.getVehicles();
              },
              child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: confirmTripController.confirmTripList.length,
                  itemBuilder: ((context, index) {
                    String pickUpCoordinates =  confirmTripController.confirmTripList[index].getTripDetails!.map.toString();
                    List<String> pickUpParts = pickUpCoordinates.split(' ');

                    double upLat = double.parse(pickUpParts[0]);
                    double upLng = double.parse(pickUpParts[1]);

                    String downCoordinates =  confirmTripController.confirmTripList[index].getTripDetails!.dropoffMap.toString();
                    List<String> downUpParts = downCoordinates.split(' ');

                    double downLat = double.parse(downUpParts[0]);
                    double downLng = double.parse(downUpParts[1]);

                    distanceTimeController.calculateDistanceAndDuration(upLat, upLng, downLat, downLng);
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        onTap: (){
                          Get.to(() => TripVivoroniDetails(confirmedTrips: confirmTripController.confirmTripList[index]));
                        },
                        child: CustomCardWidget(
                          color: white,
                          radius: 10,
                          child: Padding(
                            padding: paddingH20V10,
                            child: Column(
                              children: [
                                confirmTripController.confirmTripList[index].tripStarted == 1 && confirmTripController.confirmTripList[index].status == 0?
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: blue,
                                      ),
                                      sizeW10,
                                      Text("Running Trip",style: h2.copyWith(fontSize: 14),)
                                    ],
                                  ),
                                ):SizedBox.shrink(),
                                Row(
                                  children: [
                                    KText(
                                      text: 'ট্রিপ: ',
                                      color: black54,
                                      fontSize: 12,
                                    ),
                                    KText(
                                      text: '${confirmTripController.confirmTripList[index].trackingId}',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: black,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        child: KText(
                                          text: confirmTripController.confirmTripList[index].getVehicleBrand?.name,
                                          fontSize: 14,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                sizeH10,
                                DotDividerWidget(
                                  fillRate: .5,
                                ),
                                sizeH10,
                                SizedBox(
                                  height: 90,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor: primaryColor50,
                                        child: Icon(
                                          Ionicons.car,
                                          color: primaryColor,
                                          size: 15,
                                        ),
                                      ),
                                      sizeW20,
                                      Column(
                                        children: [
                                          sizeH5,
                                          CircleAvatar(
                                            radius: 6,
                                            backgroundColor: black,
                                            child: CircleAvatar(
                                              backgroundColor: white,
                                              radius: 5,
                                            ),
                                          ),
                                          // sizeH5,
                                          Expanded(
                                            child: Container(
                                              // height: 50,
                                              width: .7,
                                              color: grey,
                                            ),
                                          ),
                                          sizeH5,
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 5),
                                            child: CircleAvatar(
                                              radius: 6,
                                              backgroundColor: primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      sizeW10,
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              KText(
                                                text: 'শুরু: ',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                              // sizeW5,
                                              Container(
                                                width: Get.width / 2.2,
                                                child: KText(
                                                  text: confirmTripController.confirmTripList[index].getTripDetails?.pickupLocation,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                  color: black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              KText(
                                                text: 'শেষ: ',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                              // sizeW5,
                                              Container(
                                                width: Get.width / 2.2,
                                                // color: primaryColor,
                                                child: KText(
                                                  text:
                                                  confirmTripController.confirmTripList[index].getTripDetails?.dropoffLocation,
                                                  fontSize: 14,
                                                  maxLines: 2,
                                                  color: black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                sizeH10,
                                DotDividerWidget(
                                  fillRate: .5,
                                ),
                                sizeH10,
                                rawText(
                                  title: 'যাত্রার সময়',
                                  content: confirmTripController.confirmTripList[index].getTripDetails?.datetime,
                                ),
                                sizeH5,
                                confirmTripController.confirmTripList[index].getTripDetails?.roundTrip == 1?  rawText(
                                  title: 'ফিরতি তারিখ',
                                  content: confirmTripController.confirmTripList[index].getTripDetails?.roundDatetime,
                                ): SizedBox.shrink(),
                                sizeH5,
                                rawText(
                                  title: 'রাউন্ড ট্রিপ',
                                  content: confirmTripController.confirmTripList[index].getTripDetails?.roundTrip == 1? 'হ্যাঁ': "না",
                                ),
                                sizeH5,
                                rawText(
                                  title: 'দুরুত্ব',
                                  content: '${distanceTimeController.totalDistance} কি:মি',
                                ),
                                sizeH5,
                                rawText(
                                  title: 'এয়ার কন্ডিশন',
                                  content: vehiclesController.vehiclesList[int.parse(confirmTripController.confirmTripList[index].vehicleId.toString())].aircondition == "yes"? 'হ্যাঁ': "না",
                                ),
                                sizeH5,
                                Row(
                                  children: [
                                    KText(
                                      text: '${vehiclesController.vehiclesList[int.parse(confirmTripController.confirmTripList[index].vehicleId.toString())].metro}-'
                                          '${vehiclesController.vehiclesList[int.parse(confirmTripController.confirmTripList[index].vehicleId.toString())].metroType}-'
                                          '${vehiclesController.vehiclesList[int.parse(confirmTripController.confirmTripList[index].vehicleId.toString())].metroNo}',
                                      fontSize: 14,
                                    ),
                                    Spacer(),
                                    KText(
                                      text: 'রেন্টাল ভাড়া ৳ ${confirmTripController.confirmTripList[index].amount}',
                                      fontSize: 14,
                                    ),
                                  ],
                                ),
                                sizeH10,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    outlineButton(
                                      buttonName: confirmTripController.confirmTripList[index].tripStarted == 1? "TRIP START":'CONFIRMED',
                                      textColor: white,
                                      backgroundColor: HexColor('#842a8f'),
                                      outlineColor: HexColor('#842a8f'),
                                      radius: 5,
                                      height: 30,
                                      width: 90,
                                      fontSize: 14,
                                      onTap: () {},
                                    ),

                                    CircleAvatar(
                                      radius: 12,
                                      backgroundColor: black54,
                                      child: CircleAvatar(
                                        radius: 11,
                                        backgroundColor: white,
                                        child: Icon(
                                          Ionicons.person_add_outline,
                                          color: black45,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
            ),)
        ),
      ),
    );
  }

  rawText({
    required title,
    required content,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KText(
            text: title == null ? '' : '$title:',
            fontSize: 14,
            color: black45,
          ),
          title == null ? sizeH10 : sizeW10,
          KText(
            text: content,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ],
      );
}

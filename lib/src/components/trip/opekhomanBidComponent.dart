
import 'package:druto_seba_driver/src/modules/trip/controller/distance_time_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/waiting_bid_trip_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/views/map_page_view.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/button/outlineButton.dart';
import '../../widgets/card/customCardWidget.dart';
import '../../widgets/dottedDivider/dotDivider.dart';
import '../../widgets/text/kText.dart';

class OpekhomanBidComponent extends StatelessWidget {
  final WaitingTripController waitingTripController = Get.put(WaitingTripController());
  final DistanceTimeController distanceTimeController = Get.put(DistanceTimeController());
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: paddingH10,
      child: Obx(() => waitingTripController.isLoading.value == true? CustomLoader(color: black, size: 30) : ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: waitingTripController.waitingTripList.length,
          itemBuilder: ((context, index) {
            String pickUpCoordinates = waitingTripController.waitingTripList[index].getTripDetails!.map.toString();
            List<String> pickUpParts = pickUpCoordinates.split(' ');

            double upLat = double.parse(pickUpParts[0]);
            double upLng = double.parse(pickUpParts[1]);

            String downCoordinates = waitingTripController.waitingTripList[index].getTripDetails!.dropoffMap.toString();
            List<String> downUpParts = downCoordinates.split(' ');

            double downLat = double.parse(downUpParts[0]);
            double downLng = double.parse(downUpParts[1]);
            print("${ waitingTripController.waitingTripList[index].getTripDetails!.map.toString()} ${ waitingTripController.waitingTripList[index].getTripDetails!.dropoffMap.toString()}");

            distanceTimeController.calculateDistanceAndDuration(upLat, upLng, downLat, downLng);
            return Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: CustomCardWidget(
                color: white,
                radius: 10,
                child: Padding(
                  padding: paddingH20V10,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          KText(
                            text: 'ট্রিপ: ',
                            color: black54,
                          ),
                          KText(
                            text: 'N/A',
                            fontWeight: FontWeight.bold,
                          ),
                          Spacer(),
                          Column(
                            children: [
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
                                    text: waitingTripController.waitingTripList[index].getBrand?.name,
                                    fontSize: 14,
                                    color: white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 3),
                              KText(
                                text: '${waitingTripController.waitingTripList[index].getBrand?.capacity} Seats',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                      sizeH10,
                      DotDividerWidget(
                        fillRate: .5,
                      ),
                      sizeH10,
                      SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 60,
                              child: Image.network(
                                Api.getImageURL(waitingTripController.waitingTripList[index].getBrand?.image),
                                height: 60,
                                width: 60,
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
                                sizeH5,
                                Container(
                                  height: 50,
                                  width: .7,
                                  color: grey,
                                ),
                                sizeH5,
                                CircleAvatar(
                                  radius: 6,
                                  backgroundColor: primaryColor,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    KText(
                                      text: 'শুরু: ',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    // sizeW5,
                                    Container(
                                      width: Get.width / 3.5,
                                      child: KText(
                                        text: waitingTripController.waitingTripList[index].getTripDetails?.pickupLocation,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    KText(
                                      text: 'শেষ: ',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    // sizeW5,
                                    Container(
                                      width: Get.width / 3.5,
                                      // color: primaryColor,
                                      child: KText(
                                        text:
                                        waitingTripController.waitingTripList[index].getTripDetails?.dropoffLocation,
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
                      sizeH20,
                      outlineButton(
                        buttonName: 'ম্যাপ দেখুন',
                        textColor: black,
                        outlineColor: grey.shade300,
                        radius: 5,
                        height: 35,
                        width: 120,
                        fontSize: 14,
                        onTap: () {
                          Get.to(() => MapWithDirections(pickUpLat: upLat, pickUpLng: upLng, dropUpLat: downLat, dropUpLng: downLng,),transition: Transition.circularReveal);
                        },
                      ),
                      sizeH10,
                      DotDividerWidget(
                        fillRate: .5,
                      ),
                      sizeH10,
                      rawText(
                        title: 'যাত্রার সময়',
                        content: waitingTripController.waitingTripList[index].getTripDetails?.datetime
                      ),
                      sizeH5,
                      waitingTripController.waitingTripList[index].getTripDetails?.roundTrip == 1?  SizedBox() : rawText(
                        title: 'ফিরতি তারিখ',
                        content: waitingTripController.waitingTripList[index].getTripDetails?.roundDatetime,
                      ),
                      sizeH5,
                      rawText(
                        title: 'রাউন্ড ট্রিপ',
                        content: waitingTripController.waitingTripList[index].getTripDetails?.roundTrip == 1? 'হ্যাঁ': "না",
                      ),
                      sizeH5,
                      rawText(
                        title: 'দুরুত্ব',
                        content: '50.44 কি:মি',
                      ),
                      sizeH5,
                      rawText(
                        title: 'এয়ার কন্ডিশন',
                        content: waitingTripController.waitingTripList[index].getvehicle?.aircondition == "yes"?'হ্যাঁ': "না",
                      ),
                      sizeH5,
                      Row(
                        children: [
                          rawText(
                            title: null,
                            content: '166 মিনিট আছে',
                          ),
                          Spacer(),
                          outlineButton(
                            buttonName: 'Pending',
                            textColor: white,
                            backgroundColor: primaryColor,
                            outlineColor: primaryColor,
                            radius: 5,
                            height: 35,
                            width: 80,
                            fontSize: 14,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),)
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

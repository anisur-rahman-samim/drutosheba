import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/modules/allGari/controller/vehicles_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/completed_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/views/map_page_view.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/loader/no_data.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../../widgets/dottedDivider/dotDivider.dart';

class CompletedTripPage extends StatefulWidget {
  @override
  State<CompletedTripPage> createState() => _CompletedTripPageState();
}

class _CompletedTripPageState extends State<CompletedTripPage> {
  final CompletedTripController completedTripController = Get.put(CompletedTripController());

  final VehiclesController vehiclesController = Get.put(VehiclesController());
  late FlutterTts flutterTts;
  @override
  void initState() {

    super.initState();
    initializeTts();
  }
  Future<void> initializeTts() async {
    flutterTts = FlutterTts();
    await flutterTts.setLanguage("bn-BD");
    await flutterTts.setPitch(1);
  }

  Future _speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'কমপ্লেটেড ট্রিপ',
          color: white,
          fontSize: 18,
        ),
      ),
      backgroundColor: greyBackgroundColor,
      body: Padding(
        padding: paddingH10,
        child: Obx(() => completedTripController.isLoading.value == true? CustomLoader(color: black, size: 30):completedTripController.completedTripList.isEmpty? NoDataView() : ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: completedTripController.completedTripList.length,
            itemBuilder: (c, i) {
              var item = completedTripController.completedTripList[i];

              String pickUpCoordinates = item.getTripDetails!.map
                  .toString();
              List<String> pickUpParts = pickUpCoordinates.split(' ');

              double upLat = double.parse(pickUpParts[0]);
              double upLng = double.parse(pickUpParts[1]);

              String downCoordinates = item.getTripDetails!.dropoffMap
                  .toString();
              List<String> downUpParts = downCoordinates.split(' ');

              double downLat = double.parse(downUpParts[0]);
              double downLng = double.parse(downUpParts[1]);

             /* return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: CustomCardWidget(
                  color: white,
                  radius: 10,
                  elevation: 0,
                  borderColor: grey.shade200,
                  child: Padding(
                    padding: paddingV10,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            KText(
                              text: 'ট্রিপ: ',
                              color: black54,
                            ),
                            KText(
                              text: '${completedTripController.completedTripList[i].trackingId}',
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        sizeH10,
                        SizedBox(
                          height: 125,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  sizeH5,
                                  Image.asset(
                                    "assets/img/pick.png",
                                    scale: 20,
                                  ),
                                  sizeH5,
                                  Container(
                                    height: 50,
                                    width: .7,
                                    color: grey,
                                  ),
                                  sizeH5,
                                  Image.asset(
                                    "assets/img/map.png",
                                    scale: 20,
                                  ),
                                  // CircleAvatar(
                                  //   radius: 6,
                                  //   backgroundColor: primaryColor,
                                  // ),
                                ],
                              ),
                              sizeW10,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      KText(
                                        text: 'পিকআপ লোকেশন: ',
                                        color: black54,
                                        fontSize: 14,
                                      ),
                                      // sizeW5,
                                      Container(
                                        width: Get.width / 1.3,
                                        child: KText(
                                          text: completedTripController.completedTripList[i].getTripDetails?.pickupLocation,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    width: Get.width / 1.23,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: .2,
                                            color: grey,
                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundColor: grey,
                                          child: CircleAvatar(
                                            radius: 14,
                                            backgroundColor: white,
                                            child: Icon(
                                              Icons.location_on,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      KText(
                                        text: 'ড্রপ লোকেশন: ',
                                        color: black54,
                                        fontSize: 14,
                                      ),
                                      // sizeW5,
                                      Container(
                                        width: Get.width / 1.3,
                                        // color: primaryColor,
                                        child: KText(
                                          text:
                                          completedTripController.completedTripList[i].getTripDetails?.dropoffLocation,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          maxLines: 2,
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
                        DotDividerWidget(
                          fillRate: .5,
                        ),
                        sizeH20,
                        rawText(
                          title: 'ট্রিপের সময়',
                          content: completedTripController.completedTripList[i].getTripDetails?.datetime,
                        ),
                        sizeH5,
                        Divider(),
                        sizeH5,
                        rawText(
                          title: 'যাওয়া-আসা',
                          content: completedTripController.completedTripList[i].getTripDetails?.roundTrip == 1 ?'হাঁ': "না",
                        ),
                        sizeH5,
                        Divider(),
                        sizeH5,
                        completedTripController.completedTripList[i].getTripDetails?.roundTrip == 1?  rawText(
                          title: 'ফিরতি তারিখ',
                          content: completedTripController.completedTripList[i].getTripDetails?.roundDatetime,
                        ):SizedBox.shrink(),
                        sizeH5,
                        Divider(),
                        sizeH5,
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: primaryColor,
                              radius: 15,
                              child: Icon(
                                Icons.local_taxi_rounded,
                                color: white,
                                size: 17,
                              ),
                            ),
                            sizeW10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                KText(
                                  text: '${vehiclesController.vehiclesList[int.parse(completedTripController.completedTripList[i].vehicleId.toString())].model}',
                                  fontWeight: FontWeight.w600,
                                ),
                                KText(
                                  text: '${vehiclesController.vehiclesList[int.parse(completedTripController.completedTripList[i].vehicleId.toString())].metro}-'
                                      '${vehiclesController.vehiclesList[int.parse(completedTripController.completedTripList[i].vehicleId.toString())].metroType}-'
                                      '${vehiclesController.vehiclesList[int.parse(completedTripController.completedTripList[i].vehicleId.toString())].metroNo}',
                                  fontSize: 14,
                                  color: grey,
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                KText(
                                  text: 'ভাড়া',
                                  fontSize: 14,
                                  color: grey,
                                ),
                                KText(
                                  text: '${completedTripController.completedTripList[i].amount} TK',
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
              );*/
              return  Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: CustomCardWidget(
                  color: white,
                  radius: 10,
                  child: Padding(
                    padding: paddingH10V10,
                    child: Column(
                      children: [
                        rawText(
                          title: 'ট্রিপ',
                          content: item.trackingId,
                        ),
                        sizeH10,
                        DotDividerWidget(
                          fillRate: .5,
                        ),
                        sizeH10,
                        SizedBox(
                          height: 110,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  sizeH5,
                                  Image.asset(
                                    "assets/img/pick.png",
                                    scale: 20,
                                  ),
                                  sizeH5,
                                  Container(
                                    height: 30,
                                    width: .7,
                                    color: grey,
                                  ),
                                  sizeH5,
                                  Image.asset(
                                    "assets/img/map.png",
                                    scale: 20,
                                  ),
                                  // CircleAvatar(
                                  //   radius: 6,
                                  //   backgroundColor: primaryColor,
                                  // ),
                                ],
                              ),
                              sizeW5,
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      KText(
                                        text: 'পিকআপ লোকেশন: ',
                                        color: black54,
                                        fontSize: 14,
                                      ),
                                      // sizeW5,
                                      Container(
                                        width: Get.width / 2,
                                        child: KText(
                                          text: item.getTripDetails?.pickupLocation,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  //  Spacer(),

                                  sizeH10,
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      KText(
                                        text: 'ড্রপ লোকেশন: ',
                                        color: black54,
                                        fontSize: 14,
                                      ),
                                      // sizeW5,
                                      Container(
                                        height: 35,
                                        width: Get.width / 2,
                                        // color: primaryColor,
                                        child: KText(
                                          text: item.getTripDetails?.dropoffLocation,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              sizeW10,
                              Column(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        shape: BoxShape.circle),
                                    child: Image.network(
                                      Api.getImageURL(
                                          item.getVehicleBrand
                                              ?.image),
                                      width: 30,
                                      height: 40,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  sizeW5,
                                  KText(
                                    text:
                                    '${item.getVehicleBrand?.name} | \n${item.getVehicleBrand?.capacity} Seats',
                                    fontSize: 13,
                                    color: black,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        /*DotDividerWidget(
                        fillRate: .5,
                      ),*/

                        DotDividerWidget(
                          fillRate: .5,
                        ),

                        sizeH10,
                        //Divider(),
                        item.getTripDetails?.roundTrip ==
                            1
                            ? rawText(
                          title: 'ফিরতি তারিখ',
                          content: item.getTripDetails?.roundDatetime,
                        )
                            : SizedBox.shrink(),
                        sizeH5,
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(
                                        () => MapWithDirections(
                                      pickUpLat: upLat,
                                      pickUpLng: upLng,
                                      dropUpLat: downLat,
                                      dropUpLng: downLng,
                                    ),
                                    transition:
                                    Transition.circularReveal);
                              },
                              child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(30),
                                  color: primaryColor,
                                ),
                                child: Icon(
                                  Icons.location_on,
                                  color: white,
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: primaryColor,
                              ),
                              child: Container(
                                width: Get.width,
                                height: 25,
                                child: Center(
                                  child: InkWell(
                                      onTap: () {
                                        _speak(
                                            "পিকআপ লোকেশন,${item.getTripDetails?.pickupLocation},ড্রপ লোকেশন, ${item.getTripDetails?.dropoffLocation}");
                                      },
                                      child: Icon(
                                        Icons.volume_up_outlined,
                                        color: white,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),)
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
          ),
          Spacer(),
          KText(
            text: content,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ],
      );
}

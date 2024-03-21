import 'package:druto_seba_driver/src/components/trip/filterTripComponent.dart';
import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/modules/allGari/controller/vehicles_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/tripDetailsPage.dart';
import 'package:druto_seba_driver/src/modules/trip/views/map_page_view.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/division_find/division_find.dart';
import 'package:druto_seba_driver/src/widgets/dottedDivider/dotDivider.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/loader/no_data.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import '../../components/trip/tripRequestComponent.dart';
import 'completedTripPage.dart';
import 'controller/trip_request_controller.dart';

class TripRequestPage extends StatefulWidget {
  @override
  State<TripRequestPage> createState() => _TripRequestPageState();
}

class _TripRequestPageState extends State<TripRequestPage> {
  final TripRequestController tripRequestController = Get.put(TripRequestController());
  final VehiclesController vehiclesController = Get.put(VehiclesController());
  late FlutterTts flutterTts;

  final DivisionController divisionController = Get.put(DivisionController());

  @override
  void initState() {
    vehiclesController.getVehicles();
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

  // void _resetList() {}

  // Future _getList() {
  //   return _refresh();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'ট্রিপ রিকোয়েস্ট',
          color: white,
          fontSize: 18,
        ),
        actions: [
          IconButton(
            onPressed: () {
              tripRequestController.getTripResqust();
            },
            splashRadius: 20,
            icon: Icon(
              Icons.refresh,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: CustomCardWidget(
              onTap: () => Get.to(CompletedTripPage()),
              radius: 30,
              color: greyBackgroundColor,
              isPaddingHide: true,
              child: Row(
                children: [
                  sizeW10,
                  Icon(
                    Icons.access_time_filled_outlined,
                    size: 20,
                    color: black,
                  ),
                  sizeW5,
                  KText(
                    text: 'সকল ট্রিপ',
                    fontSize: 14,
                  ),
                  sizeW10,
                ],
              ),
            ),
          ),
          sizeW10,
        ],
        bottom: PreferredSize(
          preferredSize: Size(0, 40),
          child: FilterComponent(),
        ),
      ),
      backgroundColor: greyBackgroundColor,
      body: ListView(
        // physics: BouncingScrollPhysics(),
        children: [
          // sizeH10,

          sizeH10,
          Padding(
              padding: paddingH10,
              child: Obx(
                    () => tripRequestController.isLoading.value == true
                    ? CustomLoader(color: black, size: 30) : tripRequestController.tripRequestList.isEmpty? NoDataView()
                    : ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: tripRequestController.tripRequestList.length,
                  itemBuilder: ((context, index) {
                    String pickUpCoordinates = tripRequestController
                        .tripRequest.value.data[index].map
                        .toString();
                    List<String> pickUpParts = pickUpCoordinates.split(' ');

                    double upLat = double.parse(pickUpParts[0]);
                    double upLng = double.parse(pickUpParts[1]);

                    String downCoordinates = tripRequestController
                        .tripRequest.value.data[index].dropoffMap
                        .toString();
                    List<String> downUpParts = downCoordinates.split(' ');

                    double downLat = double.parse(downUpParts[0]);
                    double downLng = double.parse(downUpParts[1]);

                    // distanceTimeController.calculateDistanceAndDuration(upLat, upLng, downLat, downLng);
                    // divisionController.findDivision(latitude: 23.7956037 ,longitude: 90.3536548);
                    // divisionController.findDivision(double.parse(tripRequestController.tripRequestList[index].map.toString()) , double.parse(tripRequestController.tripRequestList[index].dropoffMap.toString()));


                    ///////filter::::::::::
                    if( tripRequestController.tripFilter.value == "All"){
                      return GestureDetector(
                        onTap: () => Get.to(
                                () => TripDetailsPage(
                              tripRequest: tripRequestController
                                  .tripRequestList[index],
                            ),
                            transition: Transition.circularReveal),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: CustomCardWidget(
                            color: white,
                            radius: 10,
                            child: Padding(
                              padding: paddingH10V10,
                              child: Column(
                                children: [
                                  rawText(
                                    title: 'ট্রিপের সময়',
                                    content: tripRequestController
                                        .tripRequestList[index].datetime,
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
                                                    text: tripRequestController
                                                        .tripRequestList[index]
                                                        .pickupLocation,
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
                                                    text: tripRequestController
                                                        .tripRequestList[index]
                                                        .dropoffLocation,
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
                                                    tripRequestController
                                                        .tripRequestList[index]
                                                        .vehicle
                                                        ?.image),
                                                width: 30,
                                                height: 40,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            sizeW5,
                                            KText(
                                              text:
                                              '${tripRequestController.tripRequestList[index].vehicle?.name} | \n${tripRequestController.tripRequestList[index].vehicle?.capacity} Seats',
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
                                  tripRequestController
                                      .tripRequestList[index].roundTrip ==
                                      1
                                      ? rawText(
                                    title: 'ফিরতি তারিখ',
                                    content: tripRequestController
                                        .tripRequestList[index]
                                        .roundDatetime,
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
                                                      "পিকআপ লোকেশন,${tripRequestController.tripRequestList[index].pickupLocation},ড্রপ লোকেশন, ${tripRequestController.tripRequestList[index].dropoffLocation}");
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
                        ),
                      );
                    }
                    else if( tripRequestController.tripRequestList[index].pickupLocation!.toLowerCase().contains( tripRequestController.tripFilter.value.toLowerCase()) &&
                        tripRequestController.tripRequestList[index].vehicle!.name!.toLowerCase().contains( tripRequestController.tripFilterCar.value.toLowerCase()) ){
                      return GestureDetector(
                        onTap: () => Get.to(
                                () => TripDetailsPage(
                              tripRequest: tripRequestController
                                  .tripRequestList[index],
                            ),
                            transition: Transition.circularReveal),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: CustomCardWidget(
                            color: white,
                            radius: 10,
                            child: Padding(
                              padding: paddingH10V10,
                              child: Column(
                                children: [
                                  rawText(
                                    title: 'ট্রিপের সময়',
                                    content: tripRequestController
                                        .tripRequestList[index].datetime,
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
                                                    text: tripRequestController
                                                        .tripRequestList[index]
                                                        .pickupLocation,
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
                                                    text: tripRequestController
                                                        .tripRequestList[index]
                                                        .dropoffLocation,
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
                                                    tripRequestController
                                                        .tripRequestList[index]
                                                        .vehicle
                                                        ?.image),
                                                width: 30,
                                                height: 40,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            sizeW5,
                                            KText(
                                              text:
                                              '${tripRequestController.tripRequestList[index].vehicle?.name} | \n${tripRequestController.tripRequestList[index].vehicle?.capacity} Seats',
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
                                  tripRequestController
                                      .tripRequestList[index].roundTrip ==
                                      1
                                      ? rawText(
                                    title: 'ফিরতি তারিখ',
                                    content: tripRequestController
                                        .tripRequestList[index]
                                        .roundDatetime,
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
                                                      "পিকআপ লোকেশন,${tripRequestController.tripRequestList[index].pickupLocation},ড্রপ লোকেশন, ${tripRequestController.tripRequestList[index].dropoffLocation}");
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
                        ),
                      );
                    }else{

                      return Container();

                    }}),
                ),
              )),
          sizeH40,
          sizeH20,
        ],
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
            // color: black45,
          ),
          // title == null ? sizeH10 : sizeW10,
          Spacer(),
          KText(
            text: content,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ],
      );
}

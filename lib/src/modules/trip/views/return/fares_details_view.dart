import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/distance_time_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/fare_bid_details_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/trip_start_and_end_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/model/fare_trip_model.dart';
import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:druto_seba_driver/src/widgets/dottedDivider/dotDivider.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../../../../configs/appUtils.dart';
import '../../../../widgets/card/customCardWidget.dart';
import '../../../../widgets/otp/otp_view.dart';
import '../../controller/confirm_trip_controller.dart';
import '../map_page_view.dart';

class FaresDetailsView extends StatefulWidget {
  // final FareTrip fareTrip;
  final String dateTimeData;
  final String tripId;
  const FaresDetailsView({
    super.key,
    required this.tripId,
    required this.dateTimeData,
  });

  @override
  State<FaresDetailsView> createState() => _FaresDetailsViewState();
}

class _FaresDetailsViewState extends State<FaresDetailsView> {
  late FlutterTts flutterTts;
  final DistanceTimeController distanceTimeController =
      Get.put(DistanceTimeController());
  final ConfirmTripController confirmTripController =
      Get.put(ConfirmTripController());
  final FareBidDetailsController fareBidDetailsController =
      Get.put(FareBidDetailsController());
  final TripStartEndController tripStartEndController =
      Get.put(TripStartEndController());

  final TextEditingController otpController = TextEditingController();

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
    String pickUpCoordinates =
        fareBidDetailsController.fireBidDetails.value.data!.map.toString();
    List<String> pickUpParts = pickUpCoordinates.split(' ');

    double upLat = double.parse(pickUpParts[0]);
    double upLng = double.parse(pickUpParts[1]);

    String downCoordinates = fareBidDetailsController
        .fireBidDetails.value.data!.dropoffMap
        .toString();
    List<String> downUpParts = downCoordinates.split(' ');

    double downLat = double.parse(downUpParts[0]);
    double downLng = double.parse(downUpParts[1]);

    distanceTimeController.calculateDistanceAndDuration(
        upLat, upLng, downLat, downLng);

    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'ফেয়ার ডিটেলস',
          color: white,
          fontSize: 18,
        ),
      ),
      backgroundColor: greyBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: CustomCardWidget(
          color: white,
          radius: 10,
          elevation: 0,
          borderColor: grey.shade200,
          child: Padding(
              padding: paddingV10,
              child: Obx(
                () => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/img/pick.png",
                                scale: 20,
                              ),
                              sizeW10,
                              KText(
                                text: fareBidDetailsController
                                    .fireBidDetails.value.data?.pickupLocation
                                    .toString(),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/img/map.png",
                            scale: 20,
                          ),
                          sizeW10,
                          KText(
                            text: fareBidDetailsController
                                .fireBidDetails.value.data?.dropoffLocation
                                .toString(),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      sizeH20,
                      DotDividerWidget(
                        fillRate: .5,
                      ),
                      sizeH20,
                      rawText(
                        title: 'ট্রিপের সময়',
                        content: widget.dateTimeData,
                      ),
                      sizeH5,
                      /*Divider(),
                  sizeH5,
                  rawText(
                    title: 'যাওয়া-আসা',
                    content: 'হাঁ',
                  ),
                  sizeH5,
                  Divider(),
                  sizeH5,
                  rawText(
                    title: 'ফিরতি তারিখ',
                    content: '03 Jun 2022, 12:59 PM',
                  ),
                  sizeH5,
                  Divider(),
                  sizeH5,*/
                      Row(
                        children: [
                          /* CircleAvatar(
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
                            text: 'Axio-2010',
                            fontWeight: FontWeight.w600,
                          ),
                          KText(
                            text: 'Dhaka-Metro-H-20-1605',
                            fontSize: 14,
                            color: grey,
                          ),
                        ],
                      ),*/
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              KText(
                                text: 'ভাড়া',
                                fontSize: 14,
                                color: grey,
                              ),
                              /*KText(
                            text: '207 TK',
                            fontWeight: FontWeight.w600,
                          ),*/
                              KText(
                                text:
                                    'ফেয়ার ভাড়া: ${fareBidDetailsController.fireBidDetails.value.data?.price.toString()} TK',
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomCardWidget(
                        radius: 0,
                        elevation: 0,
                        height: 75,
                        isPaddingHide: true,
                        child: Padding(
                          padding: paddingV10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              sizeW20,
                              columnText(
                                title: 'এয়ার কন্ডিশনার',
                                content: 'যেকোনো',
                                isReplaceObject: true,
                              ),
                              sizeW10,
                              Container(
                                color: grey,
                                height: 60,
                                width: .5,
                              ),
                              sizeW10,
                              columnText(
                                title: 'সম্ভাব্য সময়',
                                content:
                                    ' ${distanceTimeController.totalDuration.value} ', //1 ঘ. 40 মি.
                                isReplaceObject: true,
                              ),
                              Container(
                                color: grey,
                                height: 60,
                                width: .5,
                              ),
                              sizeW10,
                              columnText(
                                title: 'সম্ভাব্য দুরুত্ব',
                                content:
                                    '${distanceTimeController.totalDistance.value} কিঃমিঃ',
                                isReplaceObject: true,
                              ),
                              sizeW20,
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              _speak(
                                  "পিকআপ লোকেশন,${fareBidDetailsController.fireBidDetails.value.data?.pickupLocation.toString()},ড্রপ লোকেশন, ${fareBidDetailsController.fireBidDetails.value.data?.dropoffLocation.toString()} ");
                            },
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor,
                              ),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.volume_up_outlined,
                                      color: white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(
                                  () => MapWithDirections(
                                        pickUpLat: upLat,
                                        pickUpLng: upLng,
                                        dropUpLat: downLat,
                                        dropUpLng: downLng,
                                      ),
                                  transition: Transition.circularReveal);
                            },
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor,
                              ),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      fareBidDetailsController.fireBidDetails.value.data?.status == 0
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: confirmTripController.isLoading.value == true
                                  ? CustomLoader(color: black, size: 20)
                                  : CustomCardWidget(
                                      onTap: () {
                                        confirmTripController.confirmTrip(
                                            tripId: widget.tripId,
                                            bidId: fareBidDetailsController
                                                .fireBidDetails.value.data!.id
                                                .toString());
                                      },
                                      radius: 30,
                                      color: greyBackgroundColor,
                                      isPaddingHide: true,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            sizeW10,
                                            Icon(
                                              Icons.car_rental,
                                              size: 20,
                                              color: black,
                                            ),
                                            sizeW5,
                                            KText(
                                              text: 'কনফার্ম করুন',
                                              fontSize: 14,
                                            ),
                                            sizeW10,
                                          ],
                                        ),
                                      ),
                                    ),
                            )
                          : fareBidDetailsController
                                          .fireBidDetails.value.data?.status ==
                                      1 &&
                                  fareBidDetailsController
                                          .fireBidDetails.value.data?.isConfirm ==
                                      0 && fareBidDetailsController
                          .fireBidDetails.value.data?.otp !=
                          1
                              ? InkWell(
                                  onTap: () {
                                    /* tripStartEndController.startTrip(
                            tripId: confirmedTrips.tripId.toString(),
                            otp: otpController.text
                        );*/
                                  },
                                  child: Column(
                                    children: [
                                      Text("Submit OTP Here"),
                                      sizeH5,
                                      OtpForm(
                                        controller: otpController,
                                      ),
                                      sizeH10,
                                      InkWell(
                                        onLongPress: () {
                                           tripStartEndController.returnTripStart(
                                  tripId: widget.tripId.toString(),
                                  otp: otpController.text
                              );
                                        },
                                        child: Center(
                                          child: Container(
                                            height: 150,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                // borderRadius: BorderRadius.circular(30),
                                                shape: BoxShape.circle,
                                                color: primaryColor),
                                            child: Center(
                                              child: tripStartEndController
                                                          .isLoading.value ==
                                                      true
                                                  ? CustomLoader(
                                                      color: white, size: 40)
                                                  : Text(
                                                      "LONG \nPRESS",
                                                      style:
                                                          h1.copyWith(color: white),
                                                      textAlign: TextAlign.center,
                                                    ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ))
                              :  fareBidDetailsController
                          .fireBidDetails.value.data?.status ==
                          1 && fareBidDetailsController.fireBidDetails.value.data
                                              ?.isConfirm ==
                                          0 &&
                                      fareBidDetailsController
                                              .fireBidDetails.value.data?.otp ==
                                          1
                                  ? InkWell(
                                      onTap: () {
                                           tripStartEndController.returnCompleteTrip(tripId: widget.tripId.toString(),);
                                      },
                                      child: Center(
                                        child: Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              // borderRadius: BorderRadius.circular(30),
                                              shape: BoxShape.circle,
                                              color: Colors.blue),
                                          child: Center(
                                            child: tripStartEndController
                                                        .isLoading.value ==
                                                    true
                                                ? CustomLoader(
                                                    color: white, size: 40)
                                                : Text(
                                                    "TRIP \n Ongoing",
                                                    style:
                                                        h2.copyWith(color: white),
                                                    textAlign: TextAlign.center,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        // tripStartEndController.completeTrip(tripId: confirmedTrips.tripId.toString(),);
                                      },
                                      child: Center(
                                        child: Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              // borderRadius: BorderRadius.circular(30),
                                              shape: BoxShape.circle,
                                              color: Colors.blue),
                                          child: Center(
                                            child: tripStartEndController
                                                        .isLoading.value ==
                                                    true
                                                ? CustomLoader(
                                                    color: white, size: 40)
                                                : Text(
                                                    "COMPLETED \nTRIP",
                                                    style:
                                                        h2.copyWith(color: white),
                                                    textAlign: TextAlign.center,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                  
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          tripStartEndController.returnCancelTrip(tripId: widget.tripId.toString());
                        },
                        child: Center(
                          child: Container(
                            height: 30,
                            width: Get.width / 3,
                            decoration: BoxDecoration(
                              color: Colors.red.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Text("Cancel Trip",style: h2.copyWith(color: white),),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  columnText({
    required title,
    required content,
    bool? isReplaceObject = false,
  }) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          KText(
            text: isReplaceObject == true ? title : title + ':' ?? '',
            fontSize: 13,
            // color: black45,
          ),
          sizeH5,
          KText(
            text: content,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ],
      );

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

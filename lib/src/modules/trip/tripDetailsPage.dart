import 'dart:ffi';

import 'package:druto_seba_driver/src/modules/allGari/controller/vehicles_brand_controller.dart';
import 'package:druto_seba_driver/src/modules/allGari/controller/vehicles_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/bid_show_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/bid_submit_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/distance_time_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/views/map_page_view.dart';
import 'package:druto_seba_driver/src/modules/trip/views/trip_bid_show_view.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:druto_seba_driver/src/widgets/bottomSheet/customBottomSheet.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/card/customCardWidget.dart';
import '../../widgets/dottedDivider/dotDivider.dart';
import '../../widgets/text/kText.dart';
import 'model/trip_request_model.dart';

class TripDetailsPage extends StatefulWidget {
  final TripRequest tripRequest;
  TripDetailsPage({super.key, required this.tripRequest});

  @override
  State<TripDetailsPage> createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  final DistanceTimeController distanceTimeController = Get.put(DistanceTimeController());

  final BidSubmitController bidSubmitController = Get.put(BidSubmitController());
  final VehiclesController vehiclesController = Get.put(VehiclesController());
  final BidShowController bidShowController = Get.put(BidShowController());
  final TextEditingController amountController = TextEditingController();

  final VehiclesBrandController vehiclesBrandController =
  Get.put(VehiclesBrandController());

  var selectedCar = RxString('গাড়ি নির্বাচন করুন');
  var selectedCarId = RxString('');
  var selectedCarBrandId = RxString('');
  List tripCar = [];
  @override
  void initState() {

    tripCar.addAll(vehiclesController
        .approvedVehiclesList.where((p) => p.getbrand?.id.toString() == widget.tripRequest.vehicleId.toString()).toList());
    initializeTts();
    super.initState();
  }

  late FlutterTts flutterTts;




  Future<void> initializeTts() async {
    flutterTts = FlutterTts();
    await  flutterTts.setLanguage("bn-BD");
    await flutterTts.setPitch(1);
  }

  Future _speak(String text) async {
    await flutterTts.speak(text);
  }


  @override
  Widget build(BuildContext context) {
    String pickUpCoordinates =  widget.tripRequest.map.toString();
    List<String> pickUpParts = pickUpCoordinates.split(' ');

    double upLat = double.parse(pickUpParts[0]);
    double upLng = double.parse(pickUpParts[1]);

    String downCoordinates =  widget.tripRequest.dropoffMap.toString();
    List<String> downUpParts = downCoordinates.split(' ');

    double downLat = double.parse(downUpParts[0]);
    double downLng = double.parse(downUpParts[1]);

    distanceTimeController.calculateDistanceAndDuration(upLat, upLng, downLat, downLng);

    //  widget.tripRequest.vehicleId.toString() == selectedCarBrandId.value

    return Scaffold(

        appBar: AppBar(
          title: KText(
            text: 'ট্রিপ এর বিস্তারিত',
            fontSize: 18,
            color: white,
          ),
        ),
        backgroundColor: greyBackgroundColor,
        bottomSheet: Container(
          height: 65,
          width: Get.width,
          color: white,
          child: Padding(
            padding: paddingV10,
            child: Row(
              children: [
                sizeW20,
                Expanded(
                  child: CustomCardWidget(
                    onTap: () {
                      if(widget.tripRequest.vehicleId.toString() == selectedCarBrandId.value){
                        bidSubmitController.submitBid(
                            customer_id: widget.tripRequest.customerId.toString(),
                            vehicle_id: widget.tripRequest.vehicleId.toString(),
                            car_id: selectedCarId.value,
                            amount: amountController.text,
                            trip_id: widget.tripRequest.id.toString());
                      }else{
                        kSnackBar(message: "Vehicle not match", bgColor: Colors.red);
                      }

                    },
                    radius: 30,
                    borderColor: grey,
                    elevation: 0,
                    child: Center(
                      child: KText(
                        text: 'বিড করুন',
                        color: primaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                sizeW20,
                Expanded(
                  child: CustomCardWidget(
                    onTap: () {
                      customBottomSheet(
                        context: context,
                        height: Get.height / 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: KText(
                                text: 'অন্য পার্টনারদের বিড',
                                fontWeight: FontWeight.bold,
                                color: black,
                              ),
                            ),
                            Divider(),
                            KText(
                              text: 'যেভাবে কাজ করে',
                              fontWeight: FontWeight.w600,
                            ),
                            sizeH5,
                            KText(
                              text:
                              'নির্দিষ্ট পরিমানে চার্জ প্রদান করে অন্য পার্টনারদের বিড এবং এর বিস্তারিত দেখতে পাবেন',
                              fontSize: 14,
                            ),
                            sizeH20,
                            CustomCardWidget(
                              radius: 5,
                              color: greyBackgroundColor,
                              elevation: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      KText(
                                        text: '5 ৳',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      sizeW10,
                                      KText(
                                        text: 'প্রতিবার দেখার জন্য',
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                  KText(
                                    text:
                                    '*প্রতিবার বিড দেখার জন্য আলাদা চার্জ প্রযোজ্য',
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                            ),
                            sizeH20,
                            Row(
                              children: [
                                Expanded(
                                  child: CustomCardWidget(
                                    onTap: () => Get.back(),
                                    radius: 30,
                                    borderColor: grey,
                                    elevation: 0,
                                    child: Center(
                                      child: KText(
                                        text: 'না, ধন্যবাদ',
                                        color: primaryColor,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                                sizeW20,
                                Expanded(
                                  child: CustomCardWidget(
                                    onTap: () {
                                      bidShowController.getBidShowRequest(tripId: widget.tripRequest.id.toString());
                                    },
                                    radius: 30,
                                    color: primaryColor,
                                    elevation: 0,
                                    child: Center(
                                      child: KText(
                                        text: 'বিড দেখুন',
                                        color: white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            sizeH20,
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'কনফার্ম করার মাধ্যমে আপনি আমাদের',
                                    style: TextStyle(
                                      color: grey,
                                    ),
                                  ),
                                  TextSpan(
                                    onEnter: (_) {
                                      print('object');
                                    },
                                    text: ' সকল শর্তের ',
                                    style: TextStyle(
                                      color: blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'ব্যাপারে সম্মত হচ্ছেন',
                                    style: TextStyle(
                                      color: grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    radius: 30,
                    color: primaryColor,
                    elevation: 0,
                    child: Center(
                      child: KText(
                        text: 'সকল বিড দেখুন',
                        color: white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                sizeW20,
              ],
            ),
          ),
        ),
        body: Obx(() => ListView(
          children: [
            sizeH10,
            Padding(
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
                        content: widget.tripRequest.datetime,
                      ),
                      sizeH10,
                      DotDividerWidget(
                        fillRate: .5,
                      ),
                      sizeH10,
                      SizedBox(
                        height: 110,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                sizeH5,
                                Image.asset("assets/img/pick.png",scale: 20,),
                                sizeH5,
                                Container(
                                  height: 30,
                                  width: .7,
                                  color: grey,
                                ),
                                sizeH5,
                                Image.asset("assets/img/map.png",scale: 20,),
                                // CircleAvatar(
                                //   radius: 6,
                                //   backgroundColor: primaryColor,
                                // ),
                              ],
                            ),
                            sizeW5,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        text: widget.tripRequest.pickupLocation,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        text:
                                        widget.tripRequest.dropoffLocation,
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
                                      shape: BoxShape.circle
                                  ),
                                  child: Image.network(
                                    Api.getImageURL(widget.tripRequest.vehicle?.image),
                                    width: 30,
                                    height: 40,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                sizeW5,
                                KText(
                                  text: '${widget.tripRequest.vehicle?.name} | \n${widget.tripRequest.vehicle?.capacity} Seats',
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


                      sizeH5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: primaryColor,
                            ),
                            child: Icon(
                              Icons.location_on,
                              color: white,
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
                                    onTap: (){
                                      _speak("পিকআপ লোকেশন,${widget.tripRequest.pickupLocation},ড্রপ লোকেশন, ${widget.tripRequest.dropoffLocation}");
                                    },
                                    child: Icon(Icons.volume_up_outlined,color: white,)),
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
            sizeH10,
            CustomCardWidget(
              radius: 0,
              elevation: 0,
              child: Padding(
                padding: paddingV10,
                child: Column(
                  children: [
                    /*rawText(
                      title: 'ট্রিপের সময়',
                      content: widget.tripRequest.datetime,
                    ),
                    sizeH5,
                    Divider(),*/
                    sizeH5,
                    rawText(
                      title: 'যাওয়া-আসা',
                      content: widget.tripRequest.roundTrip == 0 ? "না" : 'হাঁ',
                    ),
                    sizeH5,
                    Divider(),
                    sizeH5,
                    widget.tripRequest.roundTrip == 0 ? SizedBox():  rawText(
                      title: 'ফিরতি তারিখ',
                      content: widget.tripRequest.roundDatetime,
                    ),
                  ],
                ),
              ),
            ),
            sizeH10,
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
                    /*sizeW20,
                  columnText(
                    title: 'এয়ার কন্ডিশনার',
                    content: tripRequest.vehicle.,
                    isReplaceObject: true,
                  ),
                  sizeW10,
                  Container(
                    color: grey,
                    height: 60,
                    width: .5,
                  ),*/
                    sizeW10,
                    widget.tripRequest.dropoffMap == null? SizedBox() : columnText(
                      title: 'সম্ভাব্য সময়',
                      content: distanceTimeController.totalDuration.value,
                      isReplaceObject: true,
                    ),
                    Container(
                      color: grey,
                      height: 60,
                      width: .5,
                    ),
                    sizeW10,
                    widget.tripRequest.dropoffMap == null? SizedBox() :  columnText(
                      title: 'সম্ভাব্য দুরুত্ব',
                      content: '${distanceTimeController.totalDistance.value} কিঃমিঃ',
                      isReplaceObject: true,
                    ),
                    sizeW20,
                  ],
                ),
              ),
            ),
            sizeH10,
            InkWell(
                onTap: () {
                  customBottomSheet(
                    context: context,
                    height: Get.height / 1.4,
                    child: ListView(
                      shrinkWrap: true,
                      primary: false,
                      children: [
                        Center(
                          child: KText(
                            text: 'গাড়ি নির্বাচন করুন',
                            fontSize: 18,
                          ),
                        ),
                        Divider(),
                        sizeH10,
                        Container(
                          height: Get.height / 1.7,
                          child: ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: tripCar.length,
                              itemBuilder: (c, i) {
                                final item = tripCar[i];
                                return InkWell(
                                  borderRadius: BorderRadius.circular(5),
                                  onTap: () {
                                    setState(() {
                                      selectedCar.value =
                                          item.model.toString();
                                      selectedCarId.value =
                                          item.id.toString();
                                      selectedCarBrandId.value =
                                          item.getbrand!.id.toString();
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        /* Image.asset(
                                                  Api.getImageURL(item.image.toString(),),
                                                  width: 50,
                                                  // width: Get.width / 6,
                                                ),*/
                                        sizeW20,
                                        SizedBox(
                                          width: Get.width / 1.5,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              KText(
                                                text: item.model,
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                              SizedBox(width: 3),
                                              /* KText(
                                            text: item.capacity,
                                            fontSize: 12,
                                            color: black45,
                                          ),*/
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        CircleAvatar(
                                          radius: 10,
                                          backgroundColor:
                                          selectedCar.value ==
                                              item.model
                                              ? primaryColor
                                              : grey,
                                          child: CircleAvatar(
                                            backgroundColor:
                                            selectedCar.value ==
                                                item.model
                                                ? primaryColor
                                                : white,
                                            radius: 9,
                                            child: selectedCar.value ==
                                                item.model
                                                ? Icon(
                                              Icons.done,
                                              size: 15,
                                              color: white,
                                            )
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  );
                },
                child: CustomCardWidget(radius: 3, child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text("গাড়ি",style: h3.copyWith(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(selectedCar.value,style: h4,),
                    ),
                  ],
                ),)
            ),
            sizeH10,
            CustomCardWidget( radius: 0,
                elevation: 0,
                height: 75,
                isPaddingHide: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("বিড পরিমাণ",style: h3.copyWith(fontWeight: FontWeight.bold),),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: black.withOpacity(0.3))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextField(
                            controller: amountController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "বিড পরিমাণ"
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),
            sizeH80,
          ],
        ),)
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
            fontSize: 14,
            // color: black45,
          ),
          sizeH5,
          KText(
            text: content,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ],
      );
}

import 'package:druto_seba_driver/src/app.dart';
import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/modules/allGari/controller/vehicles_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/trip_start_and_end_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/model/confirmed_trip_model.dart';
import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:druto_seba_driver/src/widgets/button/outlineButton.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/dottedDivider/dotDivider.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pinput/pinput.dart';

import '../../modules/auth/views/forgotOtpPage.dart';

class TripVivoroniDetails extends StatelessWidget {
  final ConfirmedTrips confirmedTrips;
   TripVivoroniDetails({super.key, required this.confirmedTrips});
  final VehiclesController vehiclesController = Get.put(VehiclesController());
  final TripStartEndController tripStartEndController = Get.put(TripStartEndController());
  final TextEditingController otpController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trip Details",style: h2.copyWith(color: white),),),
      body: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: CustomCardWidget(
          color: white,
          radius: 10,
          child: Padding(
            padding: paddingH20V10,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      KText(
                        text: 'ট্রিপ: ',
                        color: black54,
                        fontSize: 12,
                      ),
                      KText(
                        text: '${confirmedTrips.trackingId}',
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
                            text: confirmedTrips.getVehicleBrand?.name,
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
                                    text: confirmedTrips.getTripDetails?.pickupLocation,
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
                                    confirmedTrips.getTripDetails?.dropoffLocation,
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
                    content: confirmedTrips.getTripDetails?.datetime,
                  ),
                  sizeH5,
                  confirmedTrips.getTripDetails?.roundTrip == 1?  rawText(
                    title: 'ফিরতি তারিখ',
                    content: confirmedTrips.getTripDetails?.roundDatetime,
                  ): SizedBox.shrink(),
                  sizeH5,
                  rawText(
                    title: 'রাউন্ড ট্রিপ',
                    content: confirmedTrips.getTripDetails?.roundTrip == 1? 'হ্যাঁ': "না",
                  ),
                  sizeH5,
                  /*rawText(
                            title: 'দুরুত্ব',
                            content: '${distanceTimeController.totalDistance} কি:মি',
                          ),*/
                  sizeH5,
                  rawText(
                    title: 'এয়ার কন্ডিশন',
                    content: vehiclesController.vehiclesList[int.parse(confirmedTrips.vehicleId.toString())].aircondition == "yes"? 'হ্যাঁ': "না",
                  ),
                  sizeH5,
                  Row(
                    children: [
                      KText(
                        text: '${vehiclesController.vehiclesList[int.parse(confirmedTrips.vehicleId.toString())].metro}-'
                            '${vehiclesController.vehiclesList[int.parse(confirmedTrips.vehicleId.toString())].metroType}-'
                            '${vehiclesController.vehiclesList[int.parse(confirmedTrips.vehicleId.toString())].metroNo}',
                        fontSize: 14,
                      ),
                      Spacer(),
                      KText(
                        text: 'রেন্টাল ভাড়া ৳ ${confirmedTrips.amount}',
                        fontSize: 14,
                      ),
                    ],
                  ),
                  sizeH10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      outlineButton(
                        buttonName: confirmedTrips.status == 1? "COMPLETED" :"TRIP START",
                        textColor: white,
                        backgroundColor: HexColor('#842a8f'),
                        outlineColor: HexColor('#842a8f'),
                        radius: 5,
                        height: 30,
                        width: 90,
                        fontSize: 14,
                        onTap: () {},
                      ),

                      Row(
                        children: [
                          confirmedTrips.getDriver != null?  Text(confirmedTrips.getDriver!.name.toString()):SizedBox(),
                          sizeW10,
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
                  sizeH10,
                  DotDividerWidget(
                    fillRate: .5,
                  ),
                  sizeH10,
                  confirmedTrips.tripStarted == 0? InkWell(
                    onTap: (){
                      tripStartEndController.startTrip(
                          tripId: confirmedTrips.tripId.toString(),
                          otp: otpController.text
                      );
                    },
                    child: Column(
                   children: [
                     Text("Submit OTP Here"),
                     sizeH5,
                     OtpForm(controller: otpController,),
                     sizeH10,
                     InkWell(
                       onLongPress: (){
                         tripStartEndController.startTrip(
                             tripId: confirmedTrips.tripId.toString(),
                             otp: otpController.text
                         );
                       },
                       child: Container(
                         height: 150,
                         width: 150,
                         decoration: BoxDecoration(
                           // borderRadius: BorderRadius.circular(30),
                             shape: BoxShape.circle,
                             color: primaryColor
                         ),
                         child: Center(
                           child: tripStartEndController.isLoading.value == true? CustomLoader(color: white, size: 40) :  Text("LONG \nPRESS",style: h1.copyWith(color: white),textAlign: TextAlign.center,),
                         ),
                       ),
                     )
                   ],
                 )): confirmedTrips.tripStarted == 1 && confirmedTrips.status == 0?  InkWell(
                    onTap: (){
                      tripStartEndController.completeTrip(tripId: confirmedTrips.tripId.toString(),);
                    },
                   child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(30),
                          shape: BoxShape.circle,
                          color: Colors.blue
                      ),
                      child: Center(
                        child: tripStartEndController.isLoading.value == true? CustomLoader(color: white, size: 40) :  Text("TRIP \n Ongoing",style: h2.copyWith(color: white),textAlign: TextAlign.center,),
                      ),
                    ),
                 ):InkWell(
                    onTap: (){
                     //  tripStartEndController.completeTrip(tripId: confirmedTrips.tripId.toString(),);
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(30),
                          shape: BoxShape.circle,
                          color: Colors.blue
                      ),
                      child: Center(
                        child: tripStartEndController.isLoading.value == true? CustomLoader(color: white, size: 40) :  Text("COMPLETED \nTRIP",style: h2.copyWith(color: white),textAlign: TextAlign.center,),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
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




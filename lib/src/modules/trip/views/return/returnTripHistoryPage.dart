import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/fare_trip_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/return_trip_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/views/return/fares_view.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/dottedDivider/dotDivider.dart';

class ReturnTripHistoryPage extends StatelessWidget {
  final ReturnTripController returnTripController = Get.put(ReturnTripController());
  final FareTripController fareTripController = Get.put(FareTripController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'রিটার্ন ট্রিপ হিস্ট্রি',
          color: white,
          fontSize: 18,
        ),

      ),
      backgroundColor: bgColor,
      body: Obx(() => returnTripController.isLoading.value == true? CustomLoader(color: black, size: 30) : Padding(
        padding: EdgeInsets.all(10),
        child: RefreshIndicator(
          onRefresh: () async{
            returnTripController.getRetrunTripHistory();
          },
          child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              physics: BouncingScrollPhysics(),
              itemCount: returnTripController.returnTripList.length,
              itemBuilder: (c, i) {
                var item = returnTripController.returnTripList[i];
                return Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: CustomCardWidget(
                    color: white,
                    radius: 10,
                    elevation: 0,
                    borderColor: grey.shade200,
                    child: Padding(
                      padding: paddingV10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    size: 15,
                                  ),
                                  sizeW10,
                                  SizedBox(
                                    width: 230,
                                    child: KText(
                                      text: item.location,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: CustomCardWidget(
                                  onTap: () {
                                    fareTripController.fareTripRequest(tripId: item.id.toString());
                                  },
                                  radius: 30,
                                  color: greyBackgroundColor,
                                  isPaddingHide: true,
                                  child: Row(
                                    children: [
                                      sizeW10,
                                      Icon(
                                        Icons.monetization_on,
                                        size: 20,
                                        color: black,
                                      ),
                                      sizeW5,
                                      KText(
                                        text: 'ফেয়ার',
                                        fontSize: 14,
                                      ),
                                      sizeW10,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: 15,
                              ),
                              sizeW10,
                              SizedBox(
                                width: 230,
                                child: KText(
                                  text:
                                  item.destination,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  maxLines: 2,
                                ),
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
                            content: item.timedate,
                          ),
                          sizeH5,
                        //  Divider(),
                          /* sizeH5,
                          rawText(
                            title: 'যাওয়া-আসা',
                            content: 'হাঁ',
                          ),*/
                          sizeH5,
                        //  Divider(),
                          /*sizeH5,
                          rawText(
                            title: 'ফিরতি তারিখ',
                            content: '03 Jun 2022, 12:59 PM',
                          ),*/
                          sizeH5,
                          //Divider(),
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
                                    text: 'Axio-2010',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  KText(
                                    text: 'Dhaka-Metro-H-20-1605',
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
                                    text: '${item.amount} TK',
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

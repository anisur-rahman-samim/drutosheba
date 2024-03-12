import 'package:druto_seba_driver/src/modules/trip/controller/fare_trip_controller.dart';
import 'package:druto_seba_driver/src/widgets/dottedDivider/dotDivider.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/loader/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../configs/appColors.dart';
import '../../../../configs/appUtils.dart';
import '../../../../widgets/card/customCardWidget.dart';
import '../../../../widgets/text/kText.dart';
import 'fares_details_view.dart';

class FaresView extends StatelessWidget {
  final String tripId;
   FaresView({super.key, required this.tripId});
final FareTripController fareTripController = Get.put(FareTripController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'ফেয়ার',
          color: white,
          fontSize: 18,
        ),

      ),
      backgroundColor: greyBackgroundColor,
      body: Obx(() => fareTripController.isLoading.value == true? CustomLoader(color: black, size: 30):fareTripController.fareTripList.isEmpty? NoDataView() : Padding(
        padding: EdgeInsets.all(10),
        child:  ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: fareTripController.fareTripList.length,
            itemBuilder: (c, i) {
              var item = fareTripController.fareTripList[i];
              String originalDateTimeString = item.createdAt.toString();
              DateTime originalDateTime = DateTime.parse(originalDateTimeString).toLocal(); // Convert to local timezone
              String tripDateTime = DateFormat('dd MMM yyyy, hh:mm a').format(originalDateTime);
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
                                KText(
                                  text: item.pickupLocation,
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
                            Icon(
                              Icons.location_pin,
                              size: 15,
                            ),
                            sizeW10,
                            KText(
                              text:
                              item.dropoffLocation,
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
                          content: tripDateTime,
                        ),
                        sizeH5,
                       /* Divider(),
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
                                  text: 'ফেয়ার ভাড়া: ${item.price} TK',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: CustomCardWidget(
                            onTap: () => Get.to(() => FaresDetailsView(fareTrip: item, dateTimeData: tripDateTime,tripId:tripId),transition: Transition.circularReveal),
                            radius: 30,
                            color: greyBackgroundColor,
                            isPaddingHide: true,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  sizeW10,
                                  Icon(
                                    Icons.car_rental_sharp,
                                    size: 20,
                                    color: black,
                                  ),
                                  sizeW5,
                                  KText(
                                    text: 'ডিটেলস',
                                    fontSize: 14,
                                  ),
                                  sizeW10,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
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

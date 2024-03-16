
import 'package:druto_seba_driver/src/modules/trip/controller/trip_request_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/tripDetailsPage.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/card/customCardWidget.dart';
import '../../widgets/dottedDivider/dotDivider.dart';
import '../../widgets/text/kText.dart';

class TripRequestComponent extends StatefulWidget {
  @override
  State<TripRequestComponent> createState() => _TripRequestComponentState();
}

class _TripRequestComponentState extends State<TripRequestComponent> {
  late FlutterTts flutterTts;
  final TripRequestController tripRequestController = Get.put(TripRequestController());

  @override
  void initState() {
    super.initState();
    initializeTts();
  }

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
    return Padding(
      padding: paddingH10,
      child: Obx(() => tripRequestController.isLoading.value == true? CustomLoader(color: black, size: 30) : ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: tripRequestController.tripRequestList.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () => Get.to(() => TripDetailsPage(tripRequest: tripRequestController.tripRequestList[index],),transition: Transition.circularReveal),
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: CustomCardWidget(
                color: white,
                radius: 10,
                child: Padding(
                  padding: paddingH10V10,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomCardWidget(
                            radius: 30,
                            color: black,
                            height: 40,
                            child: Row(
                              children: [
                                Image.network(
                                  Api.getImageURL(tripRequestController.tripRequestList[index].vehicle?.image),
                                  width: 30,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                                sizeW5,
                                KText(
                                  text: '${tripRequestController.tripRequestList[index].vehicle?.name} | ${tripRequestController.tripRequestList[index].vehicle?.capacity} Seats',
                                  fontSize: 13,
                                  color: white,
                                ),
                              ],
                            ),
                          ),
                          // sizeW10,
                          Spacer(),
                          /*CustomCardWidget(
                            radius: 30,
                            borderColor: greyBackgroundColor,
                            isPaddingHide: true,
                            elevation: 0,
                            height: 40,
                            borderWidth: 2,
                            child: Row(
                              children: [
                                sizeW10,
                                Icon(
                                  Icons.access_time_filled_outlined,
                                  size: 20,
                                  color: primaryColor,
                                ),
                                sizeW5,
                                KText(
                                  text: '180 মি.',
                                  color: primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                sizeW10,
                              ],
                            ),
                          ),*/
                        ],
                      ),
                      sizeH10,
                      DotDividerWidget(
                        fillRate: .5,
                      ),
                      sizeH10,
                      SizedBox(
                        height: 115,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                sizeH5,
                                CircleAvatar(
                                  radius: 6,
                                  backgroundColor: primaryColor,
                                ),
                                sizeH5,
                                Container(
                                  height: 50,
                                  width: .7,
                                  color: grey,
                                ),
                                sizeH5,
                                Container(
                                  color: blue,
                                  padding: EdgeInsets.all(7),
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
                                      width: Get.width / 1.3,
                                      child: KText(
                                        text: tripRequestController.tripRequestList[index].pickupLocation,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                SizedBox(
                                  width: Get.width / 1.3,
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
                                      height: 20,
                                      width: Get.width / 1.3,
                                      // color: primaryColor,
                                      child: KText(
                                        text:
                                        tripRequestController.tripRequestList[index].dropoffLocation,
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
                      sizeH10,
                      DotDividerWidget(
                        fillRate: .5,
                      ),
                      Container(
                        width: Get.width,
                        height: 25,
                        child: Center(
                          child: InkWell(
                              onTap: (){
                                _speak("পিকআপ লোকেশন,${tripRequestController.tripRequestList[index].pickupLocation},ড্রপ লোকেশন, ${tripRequestController.tripRequestList[index].dropoffLocation}");
                              },
                              child: Icon(Icons.volume_up_outlined,color: Colors.red,)),
                        ),
                      ),
                      DotDividerWidget(
                        fillRate: .5,
                      ),
                      sizeH10,
                      rawText(
                        title: 'ট্রিপের সময়',
                        content: tripRequestController.tripRequestList[index].datetime,
                      ),
                      Divider(),
                      tripRequestController.tripRequestList[index].roundTrip == 1 ?   rawText(
                        title: 'ফিরতি তারিখ',
                        content: tripRequestController.tripRequestList[index].roundDatetime,
                      ):SizedBox.shrink(),
                      sizeH5,
                    ],
                  ),
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

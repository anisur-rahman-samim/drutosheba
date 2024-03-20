
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
                      rawText(
                        title: 'ট্রিপের সময়',
                        content: tripRequestController.tripRequestList[index].datetime,
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
                                        text: tripRequestController.tripRequestList[index].pickupLocation,
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
                                        tripRequestController.tripRequestList[index].dropoffLocation,
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
                                    Api.getImageURL(tripRequestController.tripRequestList[index].vehicle?.image),
                                    width: 30,
                                    height: 40,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                sizeW5,
                                KText(
                                  text: '${tripRequestController.tripRequestList[index].vehicle?.name} | \n${tripRequestController.tripRequestList[index].vehicle?.capacity} Seats',
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
                      tripRequestController.tripRequestList[index].roundTrip == 1 ?   rawText(
                        title: 'ফিরতি তারিখ',
                        content: tripRequestController.tripRequestList[index].roundDatetime,
                      ):SizedBox.shrink(),
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
                                      _speak("পিকআপ লোকেশন,${tripRequestController.tripRequestList[index].pickupLocation},ড্রপ লোকেশন, ${tripRequestController.tripRequestList[index].dropoffLocation}");
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

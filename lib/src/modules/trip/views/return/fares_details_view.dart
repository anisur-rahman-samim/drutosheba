import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/modules/trip/model/fare_trip_model.dart';
import 'package:druto_seba_driver/src/widgets/dottedDivider/dotDivider.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../../../../configs/appUtils.dart';
import '../../../../widgets/card/customCardWidget.dart';
import '../map_page_view.dart';


class FaresDetailsView extends StatefulWidget {
  final FareTrip fareTrip;
  final String dateTimeData;
  const FaresDetailsView({super.key, required this.fareTrip, required this.dateTimeData});

  @override
  State<FaresDetailsView> createState() => _FaresDetailsViewState();
}

class _FaresDetailsViewState extends State<FaresDetailsView> {
  late FlutterTts flutterTts;

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
    String pickUpCoordinates = widget.fareTrip.map.toString();
    List<String> pickUpParts = pickUpCoordinates.split(' ');

    double upLat = double.parse(pickUpParts[0]);
    double upLng = double.parse(pickUpParts[1]);

    String downCoordinates = widget.fareTrip.dropoffMap.toString();
    List<String> downUpParts = downCoordinates.split(' ');

    double downLat = double.parse(downUpParts[0]);
    double downLng = double.parse(downUpParts[1]);

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
                          text: widget.fareTrip.pickupLocation,
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
                      widget.fareTrip.dropoffLocation,
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
                        /*KText(
                          text: '207 TK',
                          fontWeight: FontWeight.w600,
                        ),*/
                        KText(
                          text: 'ফেয়ার ভাড়া: ${widget.fareTrip.price} TK',
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20,),
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
                          content: '1 ঘ. 40 মি. ',
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
                          content: '47.2 কিঃমিঃ',
                          isReplaceObject: true,
                        ),
                        sizeW20,
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 80,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){
                        _speak("পিকআপ লোকেশন,${widget.fareTrip.pickupLocation},ড্রপ লোকেশন, ${widget.fareTrip.dropoffLocation} ");
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
                              Icon(Icons.volume_up_outlined,color: white,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                      Get.to(() => MapWithDirections(pickUpLat: upLat, pickUpLng: upLng, dropUpLat: downLat, dropUpLng: downLng,),transition: Transition.circularReveal);
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
                              Icon(Icons.location_on,color: white,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CustomCardWidget(
                 //   onTap: () => Get.to(() => FaresDetailsView(),transition: Transition.circularReveal),
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
                ),
              ],
            ),
          ),
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

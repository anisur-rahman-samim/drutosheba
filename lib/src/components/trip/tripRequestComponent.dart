/*
import 'package:druto_seba_driver/src/modules/trip/controller/trip_request_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/tripDetailsPage.dart';
import 'package:druto_seba_driver/src/modules/trip/views/map_page_view.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/division_find/division_find.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/loader/no_data.dart';
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
  final TripRequestController tripRequestController =
      Get.put(TripRequestController());

  final DivisionController divisionController = Get.put(DivisionController());

  @override
  void initState() {
    setState(() {

    });
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
    return ;
  }


}
*/

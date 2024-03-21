import 'dart:async';

import 'package:druto_seba_driver/src/modules/trip/controller/waiting_bid_trip_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/model/trip_countdown_model.dart';
import 'package:get/get.dart';


class CountdownsController extends GetxController {
  final WaitingTripController waitingTripController = Get.put(WaitingTripController());
  RxList<CountdownItem> countdownItems = <CountdownItem>[].obs;
  late Timer timer;


  @override
  void onInit() {
    timeDataAdd();
    super.onInit();
   // print( "upcoming offer" +  waitingTripController.waitingTripStartTimeList[0].toString());
    startTimer();
  }

  timeDataAdd(){
    countdownItems.addAll(waitingTripController.waitingTripStartTimeList.map((date) => CountdownItem(date: DateTime.parse(date))).toList());
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // Update the countdown for each item in the list
      countdownItems.forEach((item) {
        // Calculate the difference in seconds between the current time and the target date
        int differenceInSeconds = item.date.difference(DateTime.now()).inSeconds + 3600;

        // Update the countdown value using the value setter
        item.countdown.value = differenceInSeconds;

        // Check if the countdown finishes
        if (differenceInSeconds == 0) {
       print(differenceInSeconds);

        }
      });

      // Notify GetX that the observables have been updated
      update();
      refresh();
    });
  }

}

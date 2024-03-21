import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountdownController extends GetxController {
  RxString countdown = ''.obs;

  void updateCountdown() {
    DateTime issueTime = DateTime.now().add(Duration(minutes: 30)); // Example target time
    Duration difference = issueTime.difference(DateTime.now());
    if (difference.isNegative) {
      countdown.value = "Task finished";
    } else if (difference.inHours >= 1) {
      countdown.value =
      "${difference.inHours} hours ${difference.inMinutes.remainder(60)} minutes remaining";
    } else if (difference.inMinutes >= 1) {
      countdown.value =
      "${difference.inMinutes} minutes ${difference.inSeconds.remainder(60)} seconds remaining";
    } else {
      countdown.value = "${difference.inSeconds} seconds remaining";
    }

    if (difference.inHours == -1) {
      // Trigger task finish after 1 hour
      print("Task finished");
      return;
    }
  }
}
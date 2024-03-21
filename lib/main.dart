import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'src/app.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(App());
}

 
/*import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class CountdownController extends GetxController {
  RxString countdown = ''.obs;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    updateCountdown();
    // Start the timer to update the countdown every second
    _timer = Timer.periodic(Duration(seconds: 1), (_) => updateCountdown());
  }

  @override
  void onClose() {
    super.onClose();
    // Cancel the timer when the controller is closed to prevent memory leaks
    _timer.cancel();
  }

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


class MyApp extends StatelessWidget {
  final CountdownController countdownController = Get.put(CountdownController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final CountdownController countdownController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Countdown:',
              style: TextStyle(fontSize: 20),
            ),
            Obx(
                  () => Text(
                countdownController.countdown.value,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/



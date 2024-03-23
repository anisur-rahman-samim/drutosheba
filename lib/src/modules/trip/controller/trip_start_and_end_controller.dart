import 'package:druto_seba_driver/src/modules/dashboard/dashboard.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/confirmed_trip_controller.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripStartEndController extends GetxController{
  final ConfirmedTripController confirmTripController = Get.put(ConfirmedTripController());
  var isLoading = false.obs;

  ///Trip Start
  Future startTrip({
    required String tripId,
    required String otp,


  }) async {
    try {
      isLoading(true);

      var map = <String, dynamic>{};
      map['trip_id'] = tripId;
      map['otp'] = otp;


      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.tripStarted,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
          confirmTripController.getConfirmedTrip();
          kSnackBar(message: "Trip Start Successfully", bgColor: Colors.green);
          Get.to(() => DashboardView(),transition: Transition.circularReveal);


        }else{
          kSnackBar(message: "Trip Start Unsuccessfully", bgColor: Colors.red);
        }

        isLoading(false);
      } else {
        throw 'Failed!';
      }
    } catch (e) {
      kSnackBar(message: e.toString(), bgColor: Colors.red);
    } finally {
      isLoading(false);
    }
  }

  ///Trip Complete
  Future completeTrip({
    required String tripId,


  }) async {
    try {
      isLoading(true);

      var map = <String, dynamic>{};
      map['trip_id'] = tripId;


      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.tripCompleted,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
          confirmTripController.getConfirmedTrip();
          kSnackBar(message: "Trip Completed Successfully", bgColor: Colors.green);
          Get.to(() => DashboardView(),transition: Transition.circularReveal);


        }else{
          kSnackBar(message: responseBody['message'], bgColor: Colors.red);
        }

        isLoading(false);
      } else {
        throw 'Failed!';
      }
    } catch (e) {
      kSnackBar(message: e.toString(), bgColor: Colors.red);
    } finally {
      isLoading(false);
    }
  }
}
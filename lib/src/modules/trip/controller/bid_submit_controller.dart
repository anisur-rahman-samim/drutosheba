import 'package:druto_seba_driver/src/modules/dashboard/dashboard.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/waiting_bid_trip_controller.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BidSubmitController extends GetxController{
  final WaitingTripController waitingTripController = Get.put(WaitingTripController());
  var isLoading = false.obs;

  ///Submit Bid
  Future submitBid({
    required String customer_id,
    required String vehicle_id,
    required String amount,
    required String trip_id,
    required String car_id,


  }) async {
    try {
      isLoading(true);

      var map = <String, dynamic>{};
      map['customer_id'] = customer_id;
      map['vehicle_id'] = vehicle_id;
      map['amount'] = amount;
      map['trip_id'] = trip_id;
      map['car_id'] = car_id;


      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.tripBidSubmit,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
         await waitingTripController.waitingTripRequest();
          kSnackBar(message: "Trip Bid Send Successfully", bgColor: Colors.green);
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
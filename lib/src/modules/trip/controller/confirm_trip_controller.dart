import 'package:druto_seba_driver/src/modules/dashboard/dashboard.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmTripController extends GetxController{
  var isLoading = false.obs;

  ///ConfirmTripController
  Future confirmTrip({
    required String tripId,
    required String bidId,


  }) async {
    try {
      isLoading(true);

      var map = <String, dynamic>{};
      map['trip_id'] = tripId;
      map['bid_id'] = bidId;


      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.returnTripConfirm,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){

          kSnackBar(message: "Trip Confirm Successfully", bgColor: Colors.green);
          Get.to(() => DashboardView(),transition: Transition.circularReveal);


        }else{
          kSnackBar(message: "Failed", bgColor: Colors.red);
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
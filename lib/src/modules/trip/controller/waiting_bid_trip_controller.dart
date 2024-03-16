
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/fare_trip_model.dart';
import '../model/waiting_trip_model.dart';

class WaitingTripController extends GetxController{
  var isLoading = false.obs;

  var waitingTrip = WaitingBidModel(data: []).obs;
  var waitingTripList = <WaitingBid>[].obs;


  @override
  void onInit() {
    waitingTripRequest();
    super.onInit();
  }

  ///waiting trip request
  Future waitingTripRequest() async {
    try {
      isLoading(true);

  /*    var map = <String, dynamic>{};
      map['trip_id'] = tripId;
*/

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.waitingBid,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){

          waitingTripList.clear();
          waitingTrip.value = WaitingBidModel.fromJson(responseBody);
          waitingTripList.addAll(waitingTrip.value.data);

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
import 'package:druto_seba_driver/src/modules/trip/views/return/fares_view.dart';
import 'package:druto_seba_driver/src/modules/trip/views/trip_bid_show_view.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/trip_bid_show_model.dart';


class BidShowController extends GetxController{
  var isLoading = false.obs;

  var tripBids = TripBidShowModel(data: []).obs;
  var tripBidsList = <TripBidShow>[].obs;


  ///bid request show
  Future getBidShowRequest({
    required String tripId,


  }) async {
    try {
      isLoading(true);

      var map = <String, dynamic>{};
      map['trip_id'] = tripId;


      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.tripBidShow,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){

          tripBidsList.clear();
          tripBids.value = TripBidShowModel.fromJson(responseBody);
          tripBidsList.addAll(tripBids.value.data);
        //  Get.to(() => FaresView(tripId:tripId),transition: Transition.circularReveal);

          //kSnackBar(message: "Trip Submit Successfully", bgColor: Colors.green);
            Get.off(() => TripBidShowView(),transition: Transition.circularReveal);
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
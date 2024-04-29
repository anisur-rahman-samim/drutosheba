import 'package:druto_seba_driver/src/modules/trip/model/fare_bid_details_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/return/fares_details_view.dart';

class FareBidDetailsController extends GetxController{
  var isLoading = false.obs;
  
  var fireBidDetails = FareBidDetailsModel().obs;

  Future getFareBidDetails({
    required String tripId,
    required String bidId,
    required String date,


  }) async {
    try {
      isLoading(true);

      var map = <String, dynamic>{};
      map['trip_id'] = tripId;
      map['bid_id'] = bidId;


      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.returnTripBidsDetails,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){

          fireBidDetails.value = FareBidDetailsModel.fromJson(responseBody);
          Get.to(() => FaresDetailsView(tripId: tripId, dateTimeData: date,),transition: Transition.circularReveal);

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
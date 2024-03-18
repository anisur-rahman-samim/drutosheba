import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/penalty_model.dart';

class PenaltyController extends GetxController{
  var isLoading = false.obs;

  var penalty = PenaltyModel().obs;
  var penaltyData = Data(penaltyChart: [], cancelledTrips: []).obs;
  var penaltyChart = <PenaltyChart>[].obs;

  ///penaltyDetails
  Future getPenaltyDetails({
    required String month,
    required String year,
  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['month'] = month;
      map['year'] = year;
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.penaltyHistory,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
          penalty.value = PenaltyModel.fromJson(responseBody);
          penaltyData.value = penalty.value.data!;
          penaltyChart.addAll(penalty.value.data!.penaltyChart);
          print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa" + penaltyChart.length.toString());

        }else{
          // kSnackBar(message: "Failed", bgColor: Colors.red);
        }

        isLoading(false);
      } else {
        throw 'Failed!';
      }
    } catch (e) {
      //  kSnackBar(message: e.toString(), bgColor: Colors.red);
    } finally {
      isLoading(false);
    }
  }
}
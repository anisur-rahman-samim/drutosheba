
import 'package:druto_seba_driver/src/modules/auth/model/reviews_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/snack_bar/snack_bar.dart';

class ReviewsController extends GetxController {
  var isLoading = false.obs;

  var reviewsModel = ReviewsModel().obs;
  var reviews = "".obs;


/*  @override
  void onInit() {
    getReviews();
    super.onInit();
  }*/

  void getReviews({required partnerId}) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['partner_id'] = partnerId.toString();

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(api: Api.reviews, body: map),
      );

      if (responseBody != null) {
        reviewsModel.value = ReviewsModel.fromJson(responseBody);
        isLoading(false);

      } else {
        throw 'Unable to load review data!';
      }
    } catch (e) {
      print(e);
      //  kSnackBar(message: e.toString(), bgColor: Colors.red);
    } finally {
      isLoading(false);
    }
  }

}
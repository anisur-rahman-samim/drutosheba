import 'package:druto_seba_driver/src/modules/userAccount/model/profile_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/snack_bar/snack_bar.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;

  var profileModel = ProfileModel().obs;


  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  void getProfile() async {
    try {
      isLoading(true);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.profile),
      );

      if (responseBody != null) {
        profileModel.value = ProfileModel.fromJson(responseBody);
        isLoading(false);

      } else {
        throw 'Unable to load Account data!';
      }
    } catch (e) {
      print(e);
     //  kSnackBar(message: e.toString(), bgColor: Colors.red);
    } finally {
      isLoading(false);
    }
  }

}

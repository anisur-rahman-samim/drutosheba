import 'package:druto_seba_driver/src/configs/app_texts.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:druto_seba_driver/src/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/snack_bar/snack_bar.dart';
import '../../dashboard/dashboard.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  ///login Controller
  Future login({
    required String phone,
    required String password,
  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['phone'] = phone;
      map['password'] = password;
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.login,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
          LocalStorage.saveData(key: AppTexts.token, data: responseBody['token']);
          kSnackBar(message: "Login Successfully Done", bgColor: Colors.green);
          Get.to(() => DashboardView(),transition: Transition.circularReveal);
        }else{
          kSnackBar(message: "Login Failed", bgColor: Colors.red);
        }

        isLoading(false);
      } else {
        throw 'Logged in Failed!';
      }
    } catch (e) {
      // kSnackBar(message: e.toString(), bgColor: failedColor);
    } finally {
      isLoading(false);
    }
  }

}
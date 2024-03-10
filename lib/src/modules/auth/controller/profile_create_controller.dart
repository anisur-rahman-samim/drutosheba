import 'package:druto_seba_driver/src/modules/auth/model/divisions_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../network/base_client/base_client.dart';

class ProfileCreateController extends GetxController {
  var isLoading = false.obs;
  var divisions = DivisionsModel(data: []).obs;
  var divisionsList = <Datum>[].obs;

  @override
  void onInit() {
    getDivisions();
    super.onInit();
  }

  ///Profile Create Controller
  Future profileCreate({
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

        }else{
          kSnackBar(message: "Failed", bgColor: Colors.red);
        }

        isLoading(false);
      } else {
        throw 'Failed!';
      }
    } catch (e) {
      // kSnackBar(message: e.toString(), bgColor: failedColor);
    } finally {
      isLoading(false);
    }
  }

  ///Divisions
  void getDivisions() async {
    try {
      isLoading(true);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.divisions),
      );

      if (responseBody != null) {
        divisionsList.clear();

        divisions.value = DivisionsModel.fromJson(responseBody);
        divisionsList.addAll(divisions.value.data);

        isLoading(false);

      } else {
        throw 'Unable to load data!';
      }
    } catch (e) {
      print(e);
      //  kSnackBar(message: e.toString(), bgColor: Colors.red);
    } finally {
      isLoading(false);
    }
  }
}
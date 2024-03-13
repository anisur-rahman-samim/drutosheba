import 'package:druto_seba_driver/src/modules/dashboard/model/dashboard_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController{
  var isLoading = false.obs;

  var dashboard = DashboardModel().obs;
  var dashboardData = Data().obs;

  ///login Controller
  Future dashboardDetails({
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
          api: Api.dashboard,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
          dashboard.value = DashboardModel.fromJson(responseBody);
          dashboardData.value = dashboard.value.data!;

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
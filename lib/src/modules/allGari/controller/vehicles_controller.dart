import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../network/base_client/base_client.dart';
import '../model/vehicles_model.dart';

class VehiclesController extends GetxController{
  var isLoading = false.obs;
  var vehicles = VehiclesModel(data: []).obs;
  var vehiclesList = <Vehicles>[].obs;
  var approvedVehiclesList = <Vehicles>[].obs;

  @override
  void onInit() {
    getVehicles();
    super.onInit();
  }


  void getVehicles() async {
    try {
      isLoading(true);
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.vehicleManage),
      );
      if (responseBody != null) {
        vehiclesList.clear();
        approvedVehiclesList.clear();

        vehicles.value = VehiclesModel.fromJson(responseBody);
        vehiclesList.addAll(vehicles.value.data);

        approvedVehiclesList.addAll(vehicles.value.data.where((element) => element.status == "approved"));


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

  void vehiclesDelete({required carId}) async {
    try {
      isLoading(true);

      var map = <String, dynamic>{};

      map['car_id'] = carId;
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(api: Api.vehicleDelete,body: map),
      );

      if (responseBody != null) {
        getVehicles();
        kSnackBar(message: responseBody["massage"], bgColor: Colors.red);
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
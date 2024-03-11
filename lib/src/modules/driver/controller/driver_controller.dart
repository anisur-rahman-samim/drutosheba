import 'package:druto_seba_driver/src/modules/driver/model/driver_model.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:get/get.dart';

import '../../../network/api/api.dart';

class DriverController extends GetxController{
  var isLoading = false.obs;
  var drivers = DriversModel(data: []).obs;
  var driverList = <Datum>[].obs;

  @override
  void onInit() {
    getDriver();
    super.onInit();
  }


  void getDriver() async {
    try {
      isLoading(true);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.driverManage),
      );

      if (responseBody != null) {
        driverList.clear();

        drivers.value = DriversModel.fromJson(responseBody);
        driverList.addAll(drivers.value.data);

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
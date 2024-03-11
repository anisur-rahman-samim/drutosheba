import 'package:druto_seba_driver/src/modules/allGari/model/vehicles_brand_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:get/get.dart';

class VehiclesBrandController extends GetxController{
  var isLoading = false.obs;
  var vehiclesBrand = VehiclesBrandModel(data: []).obs;
  var vehiclesBrandList = <Datum>[].obs;

  @override
  void onInit() {
    getVehiclesBrand();
    super.onInit();
  }

  //
  void getVehiclesBrand() async {
    try {
      isLoading(true);
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.vehicles),
      );
      if (responseBody != null) {
        vehiclesBrandList.clear();
        vehiclesBrand.value = VehiclesBrandModel.fromJson(responseBody);
        vehiclesBrandList.addAll(vehiclesBrand.value.data);
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
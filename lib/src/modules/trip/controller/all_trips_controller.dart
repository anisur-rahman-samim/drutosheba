import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:get/get.dart';

import '../model/all_trip_model.dart';

class AllTripController extends GetxController{
  var isLoading = false.obs;
  var allTrip = AllTripsModel(data: [],).obs;
  var allTripList = <AllTripsData>[].obs;

  @override
  void onInit() {
    getAllTrip();
    super.onInit();
  }

  getAllTrip() async {
    try {
      isLoading(true);
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.allTripList),
      );
      if (responseBody != null) {
        allTripList.clear();
        allTrip.value = AllTripsModel.fromJson(responseBody);
        allTripList.addAll(allTrip.value.data);
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
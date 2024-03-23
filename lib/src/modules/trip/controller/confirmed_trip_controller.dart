import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:get/get.dart';

import '../model/confirmed_trip_model.dart';

class ConfirmedTripController extends GetxController{
  var isLoading = false.obs;
  var confirmTrip = ConfirmedTripsModel(data: []).obs;
  var confirmTripList = <ConfirmedTrips>[].obs;
  var startTripList = <ConfirmedTrips>[].obs;

  @override
  void onInit() {
    getConfirmedTrip();
    super.onInit();
  }

  getConfirmedTrip() async {
    try {
      isLoading(true);
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.tripConfirmList),
      );
      if (responseBody != null) {
        confirmTripList.clear();
        startTripList.clear();
        confirmTrip.value = ConfirmedTripsModel.fromJson(responseBody);
        confirmTripList.addAll(confirmTrip.value.data);
        startTripList.addAll(confirmTrip.value.data.where((element) => element.tripStarted == 1).toList());
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
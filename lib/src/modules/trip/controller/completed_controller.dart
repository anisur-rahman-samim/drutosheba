import 'package:druto_seba_driver/src/modules/trip/model/completed_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:get/get.dart';

class CompletedTripController extends GetxController{
  var isLoading = false.obs;
  var completedTrip = CompletedTripModel(data: []).obs;
  var completedTripList = <CompletedTrip>[].obs;

  @override
  void onInit() {
    getCompletedTrip();
    super.onInit();
  }

  getCompletedTrip() async {
    try {
      isLoading(true);
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.tripCompletedList),
      );
      if (responseBody != null) {
        completedTripList.clear();
        completedTrip.value = CompletedTripModel.fromJson(responseBody);
        completedTripList.addAll(completedTrip.value.data);
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
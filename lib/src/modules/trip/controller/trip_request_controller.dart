import 'package:druto_seba_driver/src/modules/trip/model/trip_request_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:get/get.dart';

class TripRequestController extends GetxController{
  var isLoading = false.obs;

  var tripRequest = TripRequestModel(data: []).obs;
  var tripRequestList = <TripRequest>[].obs;


  @override
  void onInit() {
    getTripResqust();
    super.onInit();
  }

  ///getCredit
  void getTripResqust() async {
    try {
      isLoading(true);
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.tripRequest),
      );
      if (responseBody != null) {
        tripRequestList.clear();

        tripRequest.value = TripRequestModel.fromJson(responseBody);
        tripRequestList.addAll(tripRequest.value.data);

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
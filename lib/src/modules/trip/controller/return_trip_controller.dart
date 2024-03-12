import 'package:druto_seba_driver/src/modules/dashboard/dashboard.dart';
import 'package:druto_seba_driver/src/modules/trip/model/return_trip_history_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReturnTripController extends GetxController{
  var isLoading = false.obs;

  var selectedCar = RxString('');
  var selectedCarCapacity = ''.obs;
  var selectedCarImage = ''.obs;

  var dateSelected = 'তারিখ সিলেক্ট করুন'.obs;
  var timeSelected = 'সময় সিলেক্ট করুন'.obs;

  var returnTrip = ReturnTripModel(data: []).obs;
  var returnTripList = <ReturnTrip>[].obs;


  @override
  void onInit() {
    getRetrunTripHistory();
    super.onInit();
  }

   getRetrunTripHistory() async {
    try {
      isLoading(true);
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.returnTripList),
      );
      if (responseBody != null) {
        returnTripList.clear();
        returnTrip.value = ReturnTripModel.fromJson(responseBody);
        returnTripList.addAll(returnTrip.value.data);
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

  ///retrun trip request
  Future returnTripRequest({
    required String pickupDivision,
    required String dropoffDivision,
    required String location,
    required String destination,
    required String amount,
    required String timedate,
    required String vehicleId,

  }) async {
    try {
      isLoading(true);

      var map = <String, dynamic>{};
      map['pickup_division'] = pickupDivision;
      map['dropoff_division'] = dropoffDivision;
      map['location'] = location;
      map['destination'] = destination;
      map['amount'] = amount;
      map['timedate'] = timedate;
      map['vehicle_id'] = vehicleId;

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.returnTripSubmit,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){

          kSnackBar(message: "Trip Submit Successfully", bgColor: Colors.green);
          Get.to(() => DashboardView(),transition: Transition.circularReveal);
        }else{
          kSnackBar(message: "Failed", bgColor: Colors.red);
        }

        isLoading(false);
      } else {
        throw 'Failed!';
      }
    } catch (e) {
      kSnackBar(message: e.toString(), bgColor: Colors.red);
    } finally {
      isLoading(false);
    }
  }


}
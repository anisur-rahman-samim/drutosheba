
import 'package:druto_seba_driver/src/modules/allGari/model/metro_sub_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:get/get.dart';

import '../model/metro_model.dart';

class MetroController extends GetxController{
  var isLoading = false.obs;
  var metro = MetroModel(data: []).obs;
  var metroList = <Metro>[].obs;

  var metroSub = MetroSubModel(data: []).obs;
  var metroSubList = <MetroSub>[].obs;

  @override
  void onInit() {
    getMetroList();
    getMetroSubList();
    super.onInit();
  }

  //metro
  void getMetroList() async {
    try {
      isLoading(true);
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.metroList),
      );
      if (responseBody != null) {
        metroList.clear();
        metro.value = MetroModel.fromJson(responseBody);
        metroList.addAll(metro.value.data);
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
  //metro sub
  void getMetroSubList() async {
    try {
      isLoading(true);
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.metroSubList),
      );
      if (responseBody != null) {
        metroSubList.clear();
        metroSub.value = MetroSubModel.fromJson(responseBody);
        metroSubList.addAll(metroSub.value.data);
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
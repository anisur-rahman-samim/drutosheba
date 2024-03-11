
import 'package:druto_seba_driver/src/modules/allGari/model/fual_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:get/get.dart';

class FualController extends GetxController{
  var isLoading = false.obs;
  var fual = FualModel(data: []).obs;
  var fualList = <FualList>[].obs;

  @override
  void onInit() {
    getFualList();
    super.onInit();
  }

  //
  void getFualList() async {
    try {
      isLoading(true);
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.fuelTypes),
      );
      if (responseBody != null) {
        fualList.clear();
        fual.value = FualModel.fromJson(responseBody);
        fualList.addAll(fual.value.data);
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
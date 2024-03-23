
import 'package:druto_seba_driver/src/modules/menu/model/offer_model.dart';
import 'package:druto_seba_driver/src/modules/menu/model/ref_code_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:get/get.dart';

class RefCodeController extends GetxController{
  var isLoading = false.obs;

  var refCode = RefCodeModel().obs;
  var myreferKey = ''.obs;

  @override
  void onInit() {
    getRefCode();
    super.onInit();
  }

  ///getRefCode
  void getRefCode() async {
    try {
      isLoading(true);
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.shareReferKey),
      );
      if (responseBody != null) {

        refCode.value = RefCodeModel.fromJson(responseBody);
        myreferKey.value = refCode.value.data!.myreferKey.toString();

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
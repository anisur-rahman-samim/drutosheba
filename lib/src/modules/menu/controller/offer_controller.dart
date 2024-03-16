
import 'package:druto_seba_driver/src/modules/menu/model/offer_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:get/get.dart';

class OffersController extends GetxController{
  var isLoading = false.obs;

  var offers = OffersModel(data: []).obs;
  var offersList = <Offers>[].obs;


  @override
  void onInit() {
    getOffers();
    super.onInit();
  }

  ///getCredit
  void getOffers() async {
    try {
      isLoading(true);
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.offer),
      );
      if (responseBody != null) {
        offersList.clear();

        offers.value = OffersModel.fromJson(responseBody);
        offersList.addAll(offers.value.data);

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
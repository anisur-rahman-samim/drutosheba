
import 'package:druto_seba_driver/src/modules/allGari/model/fual_model.dart';
import 'package:druto_seba_driver/src/modules/home/model/banner_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:get/get.dart';

class BannerController extends GetxController{
  var isLoading = false.obs;
  var banners = BannerModel(data: []).obs;
  var bannersList = <Banners>[].obs;
  var imageList = <String>[].obs;

  @override
  void onInit() {
    getBannersList();
    super.onInit();
  }

  //
  void getBannersList() async {
    try {
      isLoading(true);
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.banner),
      );
      if (responseBody != null) {
        bannersList.clear();
        imageList.clear();

        banners.value = BannerModel.fromJson(responseBody);
        bannersList.addAll(banners.value.data);
        imageList.addAll(banners.value.data.map((e) => e.image.toString()).toList());
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
import 'package:druto_seba_driver/src/modules/drawerPage/model/help_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:get/get.dart';

class HelpController extends GetxController{

  var isLoading = false.obs;

  var offer = HelpModel(data: []).obs;
  var helpline = "".obs;
  var email = "".obs;
  var rental_video_link = "".obs;
  var return_video_link = "".obs;
  var emergency_helpline = "".obs;
  var visit_us = "".obs;
  var privacy_policy = "".obs;
  var terms = "".obs;


 @override
  void onInit() {
    getHelp();
    super.onInit();
  }

  ///getHelp
  Future getHelp() async {
    try {
      isLoading(true);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.help,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
          offer.value = HelpModel.fromJson(responseBody);

          helpline.value = offer.value.data[0].helpline.toString();
          email.value = offer.value.data[0].email.toString();
          rental_video_link.value = offer.value.data[0].rentalVideoLink.toString();
          return_video_link.value = offer.value.data[0].returnVideoLink.toString();
          emergency_helpline.value = offer.value.data[0].emergencyHelpline.toString();
          emergency_helpline.value = offer.value.data[0].emergencyHelpline.toString();
          visit_us.value = offer.value.data[0].visitUs.toString();
          privacy_policy.value = offer.value.data[0].privacyPolicy.toString();
          terms.value = offer.value.data[0].terms.toString();

        }else{
          // kSnackBar(message: "Failed", bgColor: Colors.red);
        }

        isLoading(false);
      } else {
        throw 'Failed!';
      }
    } catch (e) {
      //  kSnackBar(message: e.toString(), bgColor: Colors.red);
    } finally {
      isLoading(false);
    }
  }
}
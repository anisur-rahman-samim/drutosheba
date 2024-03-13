import 'package:druto_seba_driver/src/modules/credit/model/credit_history_model.dart';
import 'package:druto_seba_driver/src/modules/credit/model/credit_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:get/get.dart';

class CreditController extends GetxController{
  var isLoading = false.obs;
  var credit = CreditModel().obs;

  var creditHistory = CreditHistoryModel(data: []).obs;
  var creditHistoryList = <CreditHistory>[].obs;


  @override
  void onInit() {
    getCredit();
    getCreditHistory();
    super.onInit();
  }

  ///getCredit
  void getCredit() async {
    try {
      isLoading(true);
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.credit),
      );
      if (responseBody != null) {
        credit.value = CreditModel.fromJson(responseBody);

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
  ///getCreditHistory
  void getCreditHistory() async {
    try {
      isLoading(true);
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.creditHistory),
      );
      if (responseBody != null) {
        creditHistoryList.clear();

        creditHistory.value = CreditHistoryModel.fromJson(responseBody);
        creditHistoryList.addAll(creditHistory.value.data);


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
import 'package:druto_seba_driver/src/modules/drawerPage/model/help_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/notifications_model.dart';

class NotificationsController extends GetxController{

  var isLoading = false.obs;

  var notification = NotificationsModel(data: []).obs;
  var notificationList = <Notifications>[].obs;



  @override
  void onInit() {
    getNotification();
    super.onInit();
  }

  ///getNotification
  Future getNotification() async {
    try {
      isLoading(true);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.notification,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
          notification.value = NotificationsModel.fromJson(responseBody);
          notificationList.addAll(notification.value.data);

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
  Future deleteNotification() async {
    try {
      isLoading(true);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.notificationDelete,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
          getNotification();
          kSnackBar(message: responseBody['message'], bgColor: Colors.green);
        }else{
          kSnackBar(message: responseBody['message'], bgColor: Colors.red);
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
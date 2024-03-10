import 'package:druto_seba_driver/src/configs/app_texts.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:druto_seba_driver/src/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/snack_bar/snack_bar.dart';
import '../../dashboard/dashboard.dart';
import '../views/otpPage.dart';
import '../views/registerUserInfoPage.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  ///login Controller
  Future login({
    required String phone,
    required String password,
  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['phone'] = phone;
      map['password'] = password;
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.login,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
          LocalStorage.saveData(key: AppTexts.token, data: responseBody['token']);
          kSnackBar(message: "Login Successfully Done", bgColor: Colors.green);
          Get.to(() => DashboardView(),transition: Transition.circularReveal);
        }else{
          kSnackBar(message: "Login Failed", bgColor: Colors.red);
        }

        isLoading(false);
      } else {
        throw 'Failed!';
      }
    } catch (e) {
      // kSnackBar(message: e.toString(), bgColor: failedColor);
    } finally {
      isLoading(false);
    }
  }

  ///OTP send
  Future otpSend({
    required String phone,
  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['phone'] = phone;
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.register,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
          Get.to(() => OtpPage(number: phone,),transition: Transition.circularReveal);
          kSnackBar(message: "OTP Send Successfully", bgColor: Colors.green);
        }else{
          kSnackBar(message: responseBody['message']['phone'].toString(), bgColor: Colors.red);
        }

        isLoading(false);
      } else {
        throw 'Failed!';
      }
    } catch (e) {
      // kSnackBar(message: e.toString(), bgColor: failedColor);
    } finally {
      isLoading(false);
    }
  }

  ///OTP resend
  Future otpResend({
    required String phone,
  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['phone'] = phone;
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.resend,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
          kSnackBar(message: "OTP Resend Successfully", bgColor: Colors.green);
        }else{
          kSnackBar(message: responseBody['message']['phone'].toString(), bgColor: Colors.red);
        }

        isLoading(false);
      } else {
        throw 'Failed!';
      }
    } catch (e) {
      // kSnackBar(message: e.toString(), bgColor: failedColor);
    } finally {
      isLoading(false);
    }
  }

  ///OTP verify
  Future otpVerify({
    required String phone,
    required String otp,
  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['phone'] = phone;
      map['otp'] = otp;

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.verify,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
          Get.to(() => RegisterUserInfoPage(),transition: Transition.circularReveal);
          kSnackBar(message: responseBody['message'].toString(), bgColor: Colors.green);
        }else{
          kSnackBar(message: responseBody['message'].toString(), bgColor: Colors.red);
        }

        isLoading(false);
      } else {
        throw 'Failed!';
      }
    } catch (e) {
      // kSnackBar(message: e.toString(), bgColor: failedColor);
    } finally {
      isLoading(false);
    }
  }

}
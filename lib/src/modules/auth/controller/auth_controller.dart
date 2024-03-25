import 'package:druto_seba_driver/src/configs/app_texts.dart';
import 'package:druto_seba_driver/src/modules/auth/views/loginPage.dart';
import 'package:druto_seba_driver/src/modules/userAccount/controller/profile_controller.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:druto_seba_driver/src/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/snack_bar/snack_bar.dart';
import '../../dashboard/dashboard.dart';
import '../views/forgotOtpPage.dart';
import '../views/otpPage.dart';
import '../views/registerUserInfoPage.dart';

class AuthController extends GetxController {
  final ProfileController profileController = Get.put(ProfileController());
  var isLoading = false.obs;

  ///login Controller
  Future login({
    required String phone,
    required String password,
    required String deviceToken,
  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['phone'] = phone;
      map['password'] = password;
      map['device_token'] = deviceToken;
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
           profileController.getProfile();
          Get.to(() => DashboardView(),transition: Transition.circularReveal);
        }else{
          kSnackBar(message: "Login Failed", bgColor: Colors.red);
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
          Get.to(() => RegisterUserInfoPage(number: phone,),transition: Transition.circularReveal);
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

  ///OTP forgot
  Future forgot({
    required String phone,
  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['phone'] = phone;
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.forgot,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
          Get.to(() => ForgotOtpPage(number: phone,),transition: Transition.circularReveal);
          kSnackBar(message: "Forgot OTP Send Successfully", bgColor: Colors.green);
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

  ///OTP Forgot verify
  Future forgotOtpVerify({
    required String phone,
    required String otp,
    required String password,
  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['phone'] = phone;
      map['otp'] = otp;
      map['password'] = password;

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.forgotVerify,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
          Get.to(() => LoginPage(),transition: Transition.circularReveal);
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

  ///OTP resend
  Future forgotOtpResend({
    required String phone,
  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['phone'] = phone;
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.resendForgot,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
          kSnackBar(message: "Forgot OTP Resend Successfully", bgColor: Colors.green);
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

  ///password change
  Future passwordChange({
    required String password,
  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['password'] = password;
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.passwordChange,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
          kSnackBar(message: "Password Change Successfully", bgColor: Colors.green);
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
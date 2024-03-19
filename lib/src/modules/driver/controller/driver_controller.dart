import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:druto_seba_driver/src/configs/app_texts.dart';
import 'package:druto_seba_driver/src/modules/dashboard/dashboard.dart';
import 'package:druto_seba_driver/src/modules/driver/model/driver_model.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:druto_seba_driver/src/services/local_storage.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:http_parser/http_parser.dart';
import '../../../network/api/api.dart';
import '../driverPage.dart';

class DriverController extends GetxController{
  var isLoading = false.obs;
  var drivers = DriversModel(data: []).obs;
  var driverList = <Datum>[].obs;
  var approvedDriverList = <Datum>[].obs;

  @override
  void onInit() {
    getDriver();
    super.onInit();
  }


  ///add driver
  Future driverAdd({
    required String name,
    required String phone,
    required String contactNo,
    required String email,
    required String drivingNo,
    required String address,
    required String gender,
    required String? drivingImage,
    required String? nidFront,
    required String? nidBack,
    required String? image,



  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['name'] = name;
      map['phone'] = phone;
      map['contact_no'] = contactNo;
      map['email'] = email;
      map['address'] = address;
      map['driving_no'] = drivingNo;
      map['gender'] = gender;
      map['driving_image'] = drivingImage;
      map['nid_front'] = nidFront;
      map['nid_back'] = nidBack;
      map['image'] = image;



      // Convert XFile to File
      File? imageFile;
      if (image != null) {
        imageFile = File(image);
      }
      File? nidBackFile;
      if (nidBack != null) {
        nidBackFile = File(nidBack);
      }
      File? nidFrontFile;
      if (nidFront != null) {
        nidFrontFile = File(nidFront);
      }
      File? drivingImageFile;
      if (drivingImage != null) {
        drivingImageFile = File(drivingImage);
      }
      // Create a multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Api.driverAdd),
      );
      request.headers['Accept'] = 'multipart/form-data;';
      request.headers['Authorization'] = "Bearer ${LocalStorage.getData(key: AppTexts.token)}";

      map.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      ///profile image
      if (imageFile != null) {
        var fileStream = http.ByteStream(imageFile.openRead());
        var length = await imageFile.length();
        var multipartFile = http.MultipartFile(
          'image',
          fileStream,
          length,
          filename: p.basename(imageFile.path),
          contentType: MediaType(
              'image', 'jpg'),
        );
        request.files.add(multipartFile);
      }
      /// nidBack
      if (nidBackFile != null) {
        var fileStream = http.ByteStream(nidBackFile.openRead());
        var length = await nidBackFile.length();
        var multipartFile = http.MultipartFile(
          'nid_back',
          fileStream,
          length,
          filename: p.basename(nidBackFile.path),
          contentType: MediaType(
              'nid_back', 'jpg'),
        );
        request.files.add(multipartFile);
      }
      /// nidFront
      if (nidFrontFile != null) {
        var fileStream = http.ByteStream(nidFrontFile.openRead());
        var length = await nidFrontFile.length();
        var multipartFile = http.MultipartFile(
          'nid_front',
          fileStream,
          length,
          filename: p.basename(nidFrontFile.path),
          contentType: MediaType(
              'nid_front', 'jpg'),
        );
        request.files.add(multipartFile);
      }
      /// drivingImageFile
      if (drivingImageFile != null) {
        var fileStream = http.ByteStream(drivingImageFile.openRead());
        var length = await drivingImageFile.length();
        var multipartFile = http.MultipartFile(
          'driving_image',
          fileStream,
          length,
          filename: p.basename(drivingImageFile.path),
          contentType: MediaType(
              'driving_image', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      //send request
      var response = await request.send();
      dynamic responseBody =
      json.decode(await response.stream.bytesToString());

      log(responseBody.toString());

      if (response.statusCode == 200) {
        if(responseBody['status'] == "success"){
          getDriver();
          Get.off(() => DriverPage(),transition: Transition.circularReveal);
          //kSnackBar(message: responseBody['message'], bgColor: Colors.green);
        }else{
          kSnackBar(message: "Failed", bgColor: Colors.red);
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

  ///update driver
  Future driverUpdate({
    required String name,
    required String phone,
    required String contactNo,
    required String email,
    required String drivingNo,
    required String address,
    required String gender,
    required String? drivingImage,
    required String? nidFront,
    required String? nidBack,
    required String? image,
    required String? driverId,



  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['name'] = name;
      map['phone'] = phone;
      map['contact_no'] = contactNo;
      map['email'] = email;
      map['address'] = address;
      map['driving_no'] = drivingNo;
      map['gender'] = gender;
      map['driving_image'] = drivingImage;
      map['nid_front'] = nidFront;
      map['nid_back'] = nidBack;
      map['image'] = image;
      map['driver_id'] = driverId;



      // Convert XFile to File
      File? imageFile;
      if (image != null) {
        imageFile = File(image);
      }
      File? nidBackFile;
      if (nidBack != null) {
        nidBackFile = File(nidBack);
      }
      File? nidFrontFile;
      if (nidFront != null) {
        nidFrontFile = File(nidFront);
      }
      File? drivingImageFile;
      if (drivingImage != null) {
        drivingImageFile = File(drivingImage);
      }
      // Create a multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Api.driverUpdate),
      );
      request.headers['Accept'] = 'multipart/form-data;';
      request.headers['Authorization'] = "Bearer ${LocalStorage.getData(key: AppTexts.token)}";

      map.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      ///profile image
      if (imageFile != null) {
        var fileStream = http.ByteStream(imageFile.openRead());
        var length = await imageFile.length();
        var multipartFile = http.MultipartFile(
          'image',
          fileStream,
          length,
          filename: p.basename(imageFile.path),
          contentType: MediaType(
              'image', 'jpg'),
        );
        request.files.add(multipartFile);
      }
      /// nidBack
      if (nidBackFile != null) {
        var fileStream = http.ByteStream(nidBackFile.openRead());
        var length = await nidBackFile.length();
        var multipartFile = http.MultipartFile(
          'nid_back',
          fileStream,
          length,
          filename: p.basename(nidBackFile.path),
          contentType: MediaType(
              'nid_back', 'jpg'),
        );
        request.files.add(multipartFile);
      }
      /// nidFront
      if (nidFrontFile != null) {
        var fileStream = http.ByteStream(nidFrontFile.openRead());
        var length = await nidFrontFile.length();
        var multipartFile = http.MultipartFile(
          'nid_front',
          fileStream,
          length,
          filename: p.basename(nidFrontFile.path),
          contentType: MediaType(
              'nid_front', 'jpg'),
        );
        request.files.add(multipartFile);
      }
      /// drivingImageFile
      if (drivingImageFile != null) {
        var fileStream = http.ByteStream(drivingImageFile.openRead());
        var length = await drivingImageFile.length();
        var multipartFile = http.MultipartFile(
          'driving_image',
          fileStream,
          length,
          filename: p.basename(drivingImageFile.path),
          contentType: MediaType(
              'driving_image', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      //send request
      var response = await request.send();
    //  log("this is priddddddddddddnt${response.statusCode}");
      /*dynamic responseBody =
      json.decode(await response.stream.bytesToString());

      log(responseBody.toString());
      log("this is print");*/

      if (response.statusCode == 200) {
        getDriver();
        Get.off(() => DriverPage(),transition: Transition.circularReveal);
        kSnackBar(message: "Update Successfully", bgColor: Colors.green);

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


  void getDriver() async {
    try {
      isLoading(true);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.driverManage),
      );

      if (responseBody != null) {
        driverList.clear();
        approvedDriverList.clear();

        drivers.value = DriversModel.fromJson(responseBody);
        driverList.addAll(drivers.value.data);
        approvedDriverList.addAll(drivers.value.data.where((element) => element.status == "approved").toList());

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
  void driverDelete({required driverId}) async {
    try {
      isLoading(true);

      var map = <String, dynamic>{};

      map['driver_id'] = driverId;
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(api: Api.driverDelete,body: map),
      );

      if (responseBody != null) {
        getDriver();
        kSnackBar(message: responseBody["massage"], bgColor: Colors.red);
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
  void driverAssign({required driverId, required tripId}) async {
    try {
      isLoading(true);

      var map = <String, dynamic>{};

      map['driver_id'] = driverId;
      map['trip_id'] = tripId;

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(api: Api.driverAssaign,body: map),
      );

      if (responseBody != null) {
        getDriver();
        kSnackBar(message: responseBody["massage"], bgColor: Colors.red);
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
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:druto_seba_driver/src/configs/app_texts.dart';
import 'package:druto_seba_driver/src/modules/auth/model/divisions_model.dart';
import 'package:druto_seba_driver/src/modules/auth/views/loginPage.dart';
import 'package:druto_seba_driver/src/modules/dashboard/dashboard.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/services/local_storage.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:http_parser/http_parser.dart';
import '../../../network/base_client/base_client.dart';

class ProfileCreateController extends GetxController {
  var isLoading = false.obs;
  var divisions = DivisionsModel(data: []).obs;
  var divisionsList = <Datum>[].obs;

  @override
  void onInit() {
    getDivisions();
    super.onInit();
  }

  ///Profile Create Controller
  Future profileCreate({
    required String name,
    required String phone,
    required String email,
    required String gender,
    required String address,
    required String docType,
    required String docNumber,
    required String? image,
    required String password,
    required String referCode,
    required String division,

  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['name'] = name;
      map['phone'] = phone;
      map['email'] = email;
      map['gender'] = gender;
      map['address'] = address;
      map['doc_type'] = docType;
      map['image'] = image;
      map['doc_number'] = docNumber;
      map['password'] = password;
      map['refer_code'] = referCode;
      map['division'] = division;


      // Convert XFile to File
      File? imageFile;

      if (image != null) {
        imageFile = File(image);

      }
      // Create a multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Api.registerProfile),
      );
      request.headers['Accept'] = 'multipart/form-data;';
      request.headers['Authorization'] = "Bearer ${LocalStorage.getData(key: AppTexts.token)}";

      map.forEach((key, value) {
        request.fields[key] = value.toString();
      });


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

      var response = await request.send();
      dynamic responseBody =
      json.decode(await response.stream.bytesToString());

      log(responseBody.toString());

      if (response.statusCode == 200) {
        if(responseBody['status'] == "success"){
          Get.to(() =>LoginPage(),transition: Transition.circularReveal);
          kSnackBar(message: responseBody['message'], bgColor: Colors.green);
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

  ///Divisions
  void getDivisions() async {
    try {
      isLoading(true);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Api.divisions),
      );

      if (responseBody != null) {
        divisionsList.clear();

        divisions.value = DivisionsModel.fromJson(responseBody);
        divisionsList.addAll(divisions.value.data);

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
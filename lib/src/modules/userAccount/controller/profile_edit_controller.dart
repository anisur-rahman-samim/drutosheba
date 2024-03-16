import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:druto_seba_driver/src/configs/app_texts.dart';
import 'package:druto_seba_driver/src/modules/dashboard/dashboard.dart';
import 'package:druto_seba_driver/src/modules/userAccount/controller/profile_controller.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:druto_seba_driver/src/services/local_storage.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:http_parser/http_parser.dart';

class ProfileEditController extends GetxController{
  final ProfileController profileController = Get.put(ProfileController());
  var isLoading = false.obs;
  RxString imagePath = ''.obs;


  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);

      if (image != null) {
        imagePath.value = image.path;
        print("Image path: ${image.path}");

      }
    } catch (e) {
      print(e.toString());
    }
  }


  ///profileUpdate Controller
  Future profileUpdate({
    required String name,
    required String email,
    required String gender,
    required String address,
    required String doc_type,
    required String doc_number,
    required String? image,
    required String? division,
  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['name'] = name;
      map['email'] = email;
      map['gender'] = gender;
      map['address'] = address;
      map['doc_type'] = doc_type;
      map['doc_number'] = doc_number;
      map['image'] = image;
      map['division'] = division;



      // Convert XFile to File
      File? imageFile;

      if (image != null) {
        imageFile = File(image);

      }
      // Create a multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Api.profileUpdate),
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



     /* dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.profileUpdate,
          body: map,
        ),
      );*/

      if (response.statusCode == 200) {
        if(responseBody['status'] == "success"){
          profileController.getProfile();
          Get.to(() => DashboardView(),transition: Transition.circularReveal);
          kSnackBar(message: "Profile updated", bgColor: Colors.green);
        }else{
          kSnackBar(message: "Profile update failed", bgColor: Colors.red);
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
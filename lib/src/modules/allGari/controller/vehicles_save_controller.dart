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


class VehiclesSaveController extends GetxController{
  var isLoading = false.obs;



  ///add Vehicles
  Future vehiclesAdd({
    required String brand,
    required String metro,
    required String metroType,
    required String metroNo,
    required String model,
    required String modelYear,
    required String vehicleColor,
    required String aircondition,

    required String vehicle_front_pic,
    required String vehicle_back_pic,
    required String vehicle_reg_pic,
    required String vehicle_plate_no,
    required String vehicle_root_pic,
    required String vehicle_fitness_pic,
    required String vehicle_tax_pic,
    required String vehicle_insurance_pic,
    required String vehicle_driving_front,
    required String vehicle_driving_back,


  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['vehicle_category'] = "1";
      map['brand'] = brand;
      map['metro'] = metro;
      map['metro_type'] = metroType;
      map['metro_no'] = metroNo;
      map['model'] = model;
      map['model_year'] = modelYear;
      map['vehicle_color'] = vehicleColor;
      map['aircondition'] = aircondition;

      map['vehicle_front_pic'] = vehicle_front_pic;
      map['vehicle_back_pic'] = vehicle_back_pic;
      map['vehicle_reg_pic'] = vehicle_reg_pic;
      map['vehicle_plate_no'] = vehicle_plate_no;
      map['vehicle_root_pic'] = vehicle_root_pic;
      map['vehicle_fitness_pic'] = vehicle_fitness_pic;
      map['vehicle_tax_pic'] = vehicle_tax_pic;
      map['vehicle_insurance_pic'] = vehicle_insurance_pic;
      map['vehicle_driving_front'] = vehicle_driving_front;
      map['vehicle_driving_back'] = vehicle_driving_back;



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

}
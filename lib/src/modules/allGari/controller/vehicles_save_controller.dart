import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:druto_seba_driver/src/configs/app_texts.dart';
import 'package:druto_seba_driver/src/modules/allGari/controller/vehicles_controller.dart';
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
  final VehiclesController vehiclesController = Get.put(VehiclesController());
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
    required String brand_name,
    required String fuel_type,

    required String? vehicle_front_pic,
    required String? vehicle_back_pic,
    required String? vehicle_reg_pic,
    required String? vehicle_plate_no,
    required String? vehicle_root_pic,
    required String? vehicle_fitness_pic,
    required String? vehicle_tax_pic,
    required String? vehicle_insurance_pic,
    required String? vehicle_driving_front,
    required String? vehicle_driving_back,


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
      map['brand_name'] = brand_name;
      map['fuel_type'] = fuel_type;

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



      File? vehicle_front_picFile;
      if (vehicle_front_pic != null) {
        vehicle_front_picFile = File(vehicle_front_pic);
      }
      File? vehicle_back_picFile;
      if (vehicle_back_pic != null) {
        vehicle_back_picFile = File(vehicle_back_pic);
      }
      File? vehicle_reg_picFile;
      if (vehicle_reg_pic != null) {
        vehicle_reg_picFile = File(vehicle_reg_pic);
      }
      File? vehicle_plate_noFile;
      if (vehicle_plate_no != null) {
        vehicle_plate_noFile = File(vehicle_plate_no);
      }
      File? vehicle_root_picFile;
      if (vehicle_root_pic != null) {
        vehicle_root_picFile = File(vehicle_root_pic);
      }

      File? vehicle_fitness_picFile;
      if (vehicle_fitness_pic != null) {
        vehicle_fitness_picFile = File(vehicle_fitness_pic);
      }

      File? vehicle_tax_picFile;
      if (vehicle_tax_pic != null) {
        vehicle_tax_picFile = File(vehicle_tax_pic);
      }

      File? vehicle_insurance_picFile;
      if (vehicle_insurance_pic != null) {
        vehicle_insurance_picFile = File(vehicle_insurance_pic);
      }

      File? vehicle_driving_frontFile;
      if (vehicle_driving_front != null) {
        vehicle_driving_frontFile = File(vehicle_driving_front);
      }

      File? vehicle_driving_backFile;
      if (vehicle_driving_back != null) {
        vehicle_driving_backFile = File(vehicle_driving_back);
      }

      // Create a multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Api.vehicleAdd),
      );
      request.headers['Accept'] = 'multipart/form-data;';
      request.headers['Authorization'] = "Bearer ${LocalStorage.getData(key: AppTexts.token)}";

      map.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      ///vehicle_front_pic
      if (vehicle_front_picFile != null) {
        var fileStream = http.ByteStream(vehicle_front_picFile.openRead());
        var length = await vehicle_front_picFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_front_pic',
          fileStream,
          length,
          filename: p.basename(vehicle_front_picFile.path),
          contentType: MediaType(
              'vehicle_front_pic', 'jpg'),
        );
        request.files.add(multipartFile);
      }
      /// vehicle_back_picFile
      if (vehicle_back_picFile != null) {
        var fileStream = http.ByteStream(vehicle_back_picFile.openRead());
        var length = await vehicle_back_picFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_back_pic',
          fileStream,
          length,
          filename: p.basename(vehicle_back_picFile.path),
          contentType: MediaType(
              'vehicle_back_pic', 'jpg'),
        );
        request.files.add(multipartFile);
      }
      /// vehicle_reg_picFile
      if (vehicle_reg_picFile != null) {
        var fileStream = http.ByteStream(vehicle_reg_picFile.openRead());
        var length = await vehicle_reg_picFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_reg_pic',
          fileStream,
          length,
          filename: p.basename(vehicle_reg_picFile.path),
          contentType: MediaType(
              'vehicle_reg_pic', 'jpg'),
        );
        request.files.add(multipartFile);
      }
      /// vehicle_plate_noFile
      if (vehicle_plate_noFile != null) {
        var fileStream = http.ByteStream(vehicle_plate_noFile.openRead());
        var length = await vehicle_plate_noFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_plate_no',
          fileStream,
          length,
          filename: p.basename(vehicle_plate_noFile.path),
          contentType: MediaType(
              'vehicle_plate_no', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      /// vehicle_root_picFile
      if (vehicle_root_picFile != null) {
        var fileStream = http.ByteStream(vehicle_root_picFile.openRead());
        var length = await vehicle_root_picFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_root_pic',
          fileStream,
          length,
          filename: p.basename(vehicle_root_picFile.path),
          contentType: MediaType(
              'vehicle_root_pic', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      /// vehicle_fitness_picFile
      if (vehicle_fitness_picFile != null) {
        var fileStream = http.ByteStream(vehicle_fitness_picFile.openRead());
        var length = await vehicle_fitness_picFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_fitness_pic',
          fileStream,
          length,
          filename: p.basename(vehicle_fitness_picFile.path),
          contentType: MediaType(
              'vehicle_fitness_pic', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      /// vehicle_tax_picFile
      if (vehicle_tax_picFile != null) {
        var fileStream = http.ByteStream(vehicle_tax_picFile.openRead());
        var length = await vehicle_tax_picFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_tax_pic',
          fileStream,
          length,
          filename: p.basename(vehicle_tax_picFile.path),
          contentType: MediaType(
              'vehicle_tax_pic', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      /// vehicle_insurance_picFile
      if (vehicle_insurance_picFile != null) {
        var fileStream = http.ByteStream(vehicle_insurance_picFile.openRead());
        var length = await vehicle_insurance_picFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_insurance_pic',
          fileStream,
          length,
          filename: p.basename(vehicle_insurance_picFile.path),
          contentType: MediaType(
              'vehicle_insurance_pic', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      /// vehicle_driving_frontFile
      if (vehicle_driving_frontFile != null) {
        var fileStream = http.ByteStream(vehicle_driving_frontFile.openRead());
        var length = await vehicle_driving_frontFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_driving_front',
          fileStream,
          length,
          filename: p.basename(vehicle_driving_frontFile.path),
          contentType: MediaType(
              'vehicle_driving_front', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      /// vehicle_driving_backFile
      if (vehicle_driving_backFile != null) {
        var fileStream = http.ByteStream(vehicle_driving_backFile.openRead());
        var length = await vehicle_driving_backFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_driving_back',
          fileStream,
          length,
          filename: p.basename(vehicle_driving_backFile.path),
          contentType: MediaType(
              'vehicle_driving_back', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      //send request
      var response = await request.send();
      print("Api hit: " + Api.vehicleAdd.toString());
     // print(await response.stream.bytesToString());
     dynamic responseBody =
      json.decode(await response.stream.bytesToString());

      log(responseBody.toString());
      print(response.statusCode);

      if (response.statusCode == 200) {
        if(responseBody['status'] == "success"){
          vehiclesController.getVehicles();
          Get.to(() => DashboardView(),transition: Transition.circularReveal);
          kSnackBar(message: "Vehicles add successfully", bgColor: Colors.green);
        }else{
          kSnackBar(message: "Failed", bgColor: Colors.red);
        }

        isLoading(false);
      } else {
        throw 'Failed!';
      }
    } catch (e) {
      print(e);
    //  kSnackBar(message: e.toString(), bgColor: Colors.red);
    } finally {
      isLoading(false);
    }
  }



  ///update Vehicles
  Future vehiclesUpdate({
    required String carId,
    required String brand,
    required String metro,
    required String metroType,
    required String metroNo,
    required String model,
    required String modelYear,
    required String vehicleColor,
    required String aircondition,
    required String brand_name,
    required String fuel_type,

    required String? vehicle_front_pic,
    required String? vehicle_back_pic,
    required String? vehicle_reg_pic,
    required String? vehicle_plate_no,
    required String? vehicle_root_pic,
    required String? vehicle_fitness_pic,
    required String? vehicle_tax_pic,
    required String? vehicle_insurance_pic,
    required String? vehicle_driving_front,
    required String? vehicle_driving_back,


  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['vehicle_category'] = "1";
      map['car_id'] = carId;
      map['brand'] = brand;
      map['metro'] = metro;
      map['metro_type'] = metroType;
      map['metro_no'] = metroNo;
      map['model'] = model;
      map['model_year'] = modelYear;
      map['vehicle_color'] = vehicleColor;
      map['aircondition'] = aircondition;
      map['brand_name'] = brand_name;
      map['fuel_type'] = fuel_type;

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



      File? vehicle_front_picFile;
      if (vehicle_front_pic != null) {
        vehicle_front_picFile = File(vehicle_front_pic);
      }
      File? vehicle_back_picFile;
      if (vehicle_back_pic != null) {
        vehicle_back_picFile = File(vehicle_back_pic);
      }
      File? vehicle_reg_picFile;
      if (vehicle_reg_pic != null) {
        vehicle_reg_picFile = File(vehicle_reg_pic);
      }
      File? vehicle_plate_noFile;
      if (vehicle_plate_no != null) {
        vehicle_plate_noFile = File(vehicle_plate_no);
      }
      File? vehicle_root_picFile;
      if (vehicle_root_pic != null) {
        vehicle_root_picFile = File(vehicle_root_pic);
      }

      File? vehicle_fitness_picFile;
      if (vehicle_fitness_pic != null) {
        vehicle_fitness_picFile = File(vehicle_fitness_pic);
      }

      File? vehicle_tax_picFile;
      if (vehicle_tax_pic != null) {
        vehicle_tax_picFile = File(vehicle_tax_pic);
      }

      File? vehicle_insurance_picFile;
      if (vehicle_insurance_pic != null) {
        vehicle_insurance_picFile = File(vehicle_insurance_pic);
      }

      File? vehicle_driving_frontFile;
      if (vehicle_driving_front != null) {
        vehicle_driving_frontFile = File(vehicle_driving_front);
      }

      File? vehicle_driving_backFile;
      if (vehicle_driving_back != null) {
        vehicle_driving_backFile = File(vehicle_driving_back);
      }

      // Create a multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Api.vehicleUpdate),
      );
      request.headers['Accept'] = 'multipart/form-data;';
      request.headers['Authorization'] = "Bearer ${LocalStorage.getData(key: AppTexts.token)}";

      map.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      ///vehicle_front_pic
      if (vehicle_front_picFile != null) {
        var fileStream = http.ByteStream(vehicle_front_picFile.openRead());
        var length = await vehicle_front_picFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_front_pic',
          fileStream,
          length,
          filename: p.basename(vehicle_front_picFile.path),
          contentType: MediaType(
              'vehicle_front_pic', 'jpg'),
        );
        request.files.add(multipartFile);
      }
      /// vehicle_back_picFile
      if (vehicle_back_picFile != null) {
        var fileStream = http.ByteStream(vehicle_back_picFile.openRead());
        var length = await vehicle_back_picFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_back_pic',
          fileStream,
          length,
          filename: p.basename(vehicle_back_picFile.path),
          contentType: MediaType(
              'vehicle_back_pic', 'jpg'),
        );
        request.files.add(multipartFile);
      }
      /// vehicle_reg_picFile
      if (vehicle_reg_picFile != null) {
        var fileStream = http.ByteStream(vehicle_reg_picFile.openRead());
        var length = await vehicle_reg_picFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_reg_pic',
          fileStream,
          length,
          filename: p.basename(vehicle_reg_picFile.path),
          contentType: MediaType(
              'vehicle_reg_pic', 'jpg'),
        );
        request.files.add(multipartFile);
      }
      /// vehicle_plate_noFile
      if (vehicle_plate_noFile != null) {
        var fileStream = http.ByteStream(vehicle_plate_noFile.openRead());
        var length = await vehicle_plate_noFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_plate_no',
          fileStream,
          length,
          filename: p.basename(vehicle_plate_noFile.path),
          contentType: MediaType(
              'vehicle_plate_no', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      /// vehicle_root_picFile
      if (vehicle_root_picFile != null) {
        var fileStream = http.ByteStream(vehicle_root_picFile.openRead());
        var length = await vehicle_root_picFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_root_pic',
          fileStream,
          length,
          filename: p.basename(vehicle_root_picFile.path),
          contentType: MediaType(
              'vehicle_root_pic', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      /// vehicle_fitness_picFile
      if (vehicle_fitness_picFile != null) {
        var fileStream = http.ByteStream(vehicle_fitness_picFile.openRead());
        var length = await vehicle_fitness_picFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_fitness_pic',
          fileStream,
          length,
          filename: p.basename(vehicle_fitness_picFile.path),
          contentType: MediaType(
              'vehicle_fitness_pic', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      /// vehicle_tax_picFile
      if (vehicle_tax_picFile != null) {
        var fileStream = http.ByteStream(vehicle_tax_picFile.openRead());
        var length = await vehicle_tax_picFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_tax_pic',
          fileStream,
          length,
          filename: p.basename(vehicle_tax_picFile.path),
          contentType: MediaType(
              'vehicle_tax_pic', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      /// vehicle_insurance_picFile
      if (vehicle_insurance_picFile != null) {
        var fileStream = http.ByteStream(vehicle_insurance_picFile.openRead());
        var length = await vehicle_insurance_picFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_insurance_pic',
          fileStream,
          length,
          filename: p.basename(vehicle_insurance_picFile.path),
          contentType: MediaType(
              'vehicle_insurance_pic', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      /// vehicle_driving_frontFile
      if (vehicle_driving_frontFile != null) {
        var fileStream = http.ByteStream(vehicle_driving_frontFile.openRead());
        var length = await vehicle_driving_frontFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_driving_front',
          fileStream,
          length,
          filename: p.basename(vehicle_driving_frontFile.path),
          contentType: MediaType(
              'vehicle_driving_front', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      /// vehicle_driving_backFile
      if (vehicle_driving_backFile != null) {
        var fileStream = http.ByteStream(vehicle_driving_backFile.openRead());
        var length = await vehicle_driving_backFile.length();
        var multipartFile = http.MultipartFile(
          'vehicle_driving_back',
          fileStream,
          length,
          filename: p.basename(vehicle_driving_backFile.path),
          contentType: MediaType(
              'vehicle_driving_back', 'jpg'),
        );
        request.files.add(multipartFile);
      }

      //send request
      var response = await request.send();
      print(response.statusCode);

      print("Api hit: " + Api.vehicleUpdate.toString());
       print(await response.stream.bytesToString());
      dynamic responseBody =
      json.decode(await response.stream.bytesToString());
      print(responseBody);
      log(responseBody);


      if (response.statusCode == 200) {
        if(responseBody['status'] == "success"){
          vehiclesController.getVehicles();
          Get.to(() => DashboardView(),transition: Transition.circularReveal);
          kSnackBar(message: "Vehicles update successfully", bgColor: Colors.green);
        }else{
          kSnackBar(message: "Failed", bgColor: Colors.red);
        }

        isLoading(false);
      } else {
        throw 'Failed!';
      }
    } catch (e) {
      print(e);
      //  kSnackBar(message: e.toString(), bgColor: Colors.red);
    } finally {
      isLoading(false);
    }
  }

}

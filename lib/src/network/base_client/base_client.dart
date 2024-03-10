import 'dart:convert';
import 'dart:io';
import 'package:druto_seba_driver/src/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../configs/app_texts.dart';



class BaseClient {

  static getRequest({required String api, params}) async {


    debugPrint("\nYou hit: $api");
    debugPrint("Request Params: $params");

    var headers = {
      //'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2NhcmJvb2suY3V0aWFpZGNvcnBvcmF0aW9uLmNvbS9hcGkvdjEvcGFydG5lci9sb2dpbiIsImlhdCI6MTcxMDA1NzIyMywiZXhwIjoxNzEwMTQzNjIzLCJuYmYiOjE3MTAwNTcyMjMsImp0aSI6ImMzcHc1WU9UdjlWSWtWRkoiLCJzdWIiOiI3IiwicHJ2IjoiNGY5ZTUwMzQ0MzcyMDc1ZDlkYmE3NTAwMWZiYWVjMDI2YWE2YTE3OCJ9.2uQOnsyKV54PESdjzY-TVUitVNedhsu9GskNLNXJYDQ"
    };
    debugPrint("statusCode: token: ${LocalStorage.getData(key: AppTexts.token)}");

    http.Response response = await http.get(
      Uri.parse(api).replace(queryParameters: params),
      headers: headers,
    );
    return response;
  }

  static postRequest({required String api, body}) async {

    debugPrint('\nYou hit: $api');
    debugPrint('Request Body: ${jsonEncode(body)}');

    var headers = {
      'Accept': 'application/json',
     // 'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "${LocalStorage.getData(key: AppTexts.token)}"
    };

    http.Response response = await http.post(
      Uri.parse(api),
      body: body,
      headers: headers,
    );
    return response;
  }
  static deleteRequest({required String api, body}) async {

    debugPrint('\nYou hit: $api');
    debugPrint('Request Body: ${jsonEncode(body)}');

    var headers = {
      'Accept': 'application/json',
      "Authorization":  "${LocalStorage.getData(key: AppTexts.token)}"
    };


    http.Response response = await http.delete(
      Uri.parse(api),
      body: body,
      headers: headers,
    );
    return response;
  }

  static multipartAddRequest({
    required String api,
    required Map<String, String> body,
    required String fileKeyName,
    required String filePath,
  }) async {


    debugPrint("\nYou hit: $api");
    debugPrint("Request body: $body");

    var headers = {
      'Accept': 'application/json',
      "Authorization": "${LocalStorage.getData(key: AppTexts.token)}"
    };

    http.MultipartRequest request;
    if (filePath.isEmpty || filePath == '') {
      request = http.MultipartRequest('POST', Uri.parse(api))
        ..fields.addAll(body)
        ..headers.addAll(headers);
    } else {
      request = http.MultipartRequest('POST', Uri.parse(api))
        ..fields.addAll(body)
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath(fileKeyName, filePath));
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    return response;
  }

  static handleResponse(http.Response response) async {
    try {


      if (response.statusCode >= 200 && response.statusCode <= 210) {
        debugPrint('SuccessCode: ${response.statusCode}');
        debugPrint('SuccessResponse: ${response.body}');

        if (response.body.isNotEmpty) {
          return json.decode(response.body);
        } else {
          return response.body;
        }
      } else if (response.statusCode == 401) {
        debugPrint("statusCode: 401");
        // _logout();
        String msg = "Unauthorized";
        if (response.body.isNotEmpty) {
          if(json.decode(response.body)['errors'] != null){
            msg = json.decode(response.body)['errors'];
          }
        }
        throw msg;
      } else if (response.statusCode == 404) {
        debugPrint("statusCode: 404");
        throw 'Page Not Found!';
      } else if (response.statusCode == 500) {
        debugPrint("statusCode: 500");
        throw "Server Error";
      } else {
        debugPrint('ErrorCode: ${response.statusCode}');
        debugPrint('ErrorResponse: ${response.body}');

        String msg = "Something went wrong";
        if (response.body.isNotEmpty) {
          var data = jsonDecode(response.body)['errors'];
          if(data == null){
            msg = jsonDecode(response.body)['message'] ?? msg;
          }
          else if (data is String) {
            msg = data;
          } else if (data is Map) {
            msg = data['email'][0];
          }
        }

        throw msg;
      }
    } on SocketException catch (_) {

    } on FormatException catch (_) {
      throw "Bad response format";
    } catch (e) {
      throw e.toString();
    }
  }

/*static void _logout() {
    LocalStorage.removeData(key: LocalStorageKey.token);
    Get.offAll(() => const LoginScreen());
  }*/
}
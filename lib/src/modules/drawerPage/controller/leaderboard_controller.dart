import 'package:druto_seba_driver/src/modules/drawerPage/model/dashboard_model.dart';
import 'package:druto_seba_driver/src/modules/drawerPage/model/leaderboard_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/network/base_client/base_client.dart';
import 'package:druto_seba_driver/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaderboardController extends GetxController{
  var isLoading = false.obs;

  var leaderboard = LeaderboardModel(data: []).obs;
  var leaderboardList = <Leader>[].obs;
  var topRankLeader = <Leader>[].obs;
  var downRankLeader = <Leader>[].obs;


  @override
  void onInit() {
    leaderboardDetails(month: DateTime.now().month.toString(), year: DateTime.now().year.toString());
    super.onInit();
  }

  ///leaderboardDetails
  Future leaderboardDetails({
    required String month,
    required String year,
  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['month'] = month;
      map['year'] = year;
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.leaderboard,
          body: map,
        ),
      );

      if (responseBody != null) {
        if(responseBody['status'] == "success"){
         leaderboardList.clear();

          leaderboard.value = LeaderboardModel.fromJson(responseBody);
          leaderboardList.addAll(leaderboard.value.data);
          
          topRankLeader.addAll(leaderboard.value.data.sublist(0,3));
          downRankLeader.addAll(leaderboard.value.data.sublist(3));

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
}
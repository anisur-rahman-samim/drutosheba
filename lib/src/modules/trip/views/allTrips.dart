import 'package:druto_seba_driver/src/components/trip/opekhomanBidComponent.dart';
import 'package:druto_seba_driver/src/components/trip/tripVivoroniComponent.dart';
import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/all_trips_controller.dart';
import 'package:druto_seba_driver/src/modules/trip/views/started_trip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/text_styles.dart';
import '../all_trip_screen.dart';

class AllTripsView extends StatefulWidget {
  @override
  _AllTripsViewState createState() => _AllTripsViewState();
}

class _AllTripsViewState extends State<AllTripsView> with SingleTickerProviderStateMixin {
  final AllTripController allTripController = Get.put(AllTripController());
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Trips',style: h2.copyWith(color: white),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          labelColor: white,
          isScrollable: true,
          tabs: [
            Tab(text: 'All Trips'),
            Tab(text: 'Start Trip'),
            Tab(text: 'Confirm Trip'),
            Tab(text: 'Waiting Trip'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AllTripScreen(),
          StartedTripView(),
          TripVivoroniComponent(),
          OpekhomanBidComponent(),
        ],
      ),
    );
  }


}
import 'package:druto_seba_driver/src/components/trip/opekhomanBidComponent.dart';
import 'package:druto_seba_driver/src/components/trip/tripVivoroniComponent.dart';
import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:flutter/material.dart';

import '../../../services/text_styles.dart';

class AllTripsView extends StatefulWidget {
  @override
  _AllTripsViewState createState() => _AllTripsViewState();
}

class _AllTripsViewState extends State<AllTripsView> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
        bottom: TabBar(
          controller: _tabController,
          labelColor: white,
          tabs: [
            Tab(text: 'Start Trip'),
            Tab(text: 'Confirm Trip'),
            Tab(text: 'Waiting Trip'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('Tab 1 Content')),
          TripVivoroniComponent(),
          OpekhomanBidComponent(),
        ],
      ),
    );
  }


}
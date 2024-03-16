import 'package:druto_seba_driver/src/components/trip/filterTripComponent.dart';
import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/modules/allGari/controller/vehicles_controller.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/trip/tripRequestComponent.dart';
import 'completedTripPage.dart';
import 'controller/trip_request_controller.dart';

class TripRequestPage extends StatefulWidget {
  @override
  State<TripRequestPage> createState() => _TripRequestPageState();
}

class _TripRequestPageState extends State<TripRequestPage> {
  final TripRequestController tripRequestController = Get.put(TripRequestController());
  final VehiclesController vehiclesController = Get.put(VehiclesController());
  // Future<void> _refresh() {
  //   _resetList();
  //   return _getList();
  // }

  // void _resetList() {}

  // Future _getList() {
  //   return _refresh();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'ট্রিপ রিকোয়েস্ট',
          color: white,
          fontSize: 18,
        ),
        actions: [
          IconButton(
            onPressed: () {
              tripRequestController.getTripResqust();
            },
            splashRadius: 20,
            icon: Icon(
              Icons.refresh,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: CustomCardWidget(
              onTap: () => Get.to(CompletedTripPage()),
              radius: 30,
              color: greyBackgroundColor,
              isPaddingHide: true,
              child: Row(
                children: [
                  sizeW10,
                  Icon(
                    Icons.access_time_filled_outlined,
                    size: 20,
                    color: black,
                  ),
                  sizeW5,
                  KText(
                    text: 'সকল ট্রিপ',
                    fontSize: 14,
                  ),
                  sizeW10,
                ],
              ),
            ),
          ),
          sizeW10,
        ],
        bottom: PreferredSize(
          preferredSize: Size(0, 40),
          child: FilterComponent(),
        ),
      ),
      backgroundColor: greyBackgroundColor,
      body: ListView(
        // physics: BouncingScrollPhysics(),
        children: [
          // sizeH10,

          sizeH10,
          TripRequestComponent(),
          sizeH40,
          sizeH20,
        ],
      ),
    );
  }
}

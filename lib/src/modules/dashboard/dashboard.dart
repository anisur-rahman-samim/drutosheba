import 'package:druto_seba_driver/src/components/trip/opekhomanBidComponent.dart';
import 'package:druto_seba_driver/src/components/trip/tripVivoroniComponent.dart';
import 'package:druto_seba_driver/src/components/trip/trip_time_count.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/waiting_bid_trip_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';

import '../home/homePage.dart';
import '../trip/tripHistoryPage.dart';
import '../opekhomanBid/opekhomanBidPage.dart';
import '../menu/menuPage.dart';
import '../trip/views/allTrips.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() =>
      _DashboardViewState();
}

class _DashboardViewState
    extends State<DashboardView> {

  int _selectedItemPosition = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: AnimatedContainer(
        child: _getPage(_selectedItemPosition),
        duration: const Duration(seconds: 1),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        backgroundColor: Colors.red.shade50,
        snakeShape: SnakeShape.circle,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        selectedItemColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'হোম',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mode_of_travel_outlined),
            label: 'Trips',
          ),
         /* BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'চলমান ট্রিপ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mode_of_travel_outlined),
            label: 'অপেক্ষমান বিড',
          ),*/
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'মেনু',
          ),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return AllTripsView();
      /*case 1:
        return TripVivoroniComponent();
      case 2:
        return OpekhomanBidComponent();*/
      case 2:
        return MenuPage();
      default:
        return HomePage();
    }
  }
}

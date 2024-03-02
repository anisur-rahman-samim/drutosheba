// ignore_for_file: must_be_immutable

import 'package:druto_seba_driver/src/pages/home/homePage.dart';
import 'package:druto_seba_driver/src/pages/menu/menuPage.dart';
import 'package:druto_seba_driver/src/pages/opekhomanBid/opekhomanBidPage.dart';
import 'package:druto_seba_driver/src/pages/trip/tripHistoryPage.dart';
import 'package:flutter/material.dart';
import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/text/kText.dart';

class BottombarHome extends StatefulWidget {
  @override
  State<BottombarHome> createState() => _BottombarHomeState();
}

class _BottombarHomeState extends State<BottombarHome> {
  int _currentTab = 1;

  final PageStorageBucket bucket = PageStorageBucket();

  Widget _currentScreens = HomePage();
  // Widget _currentScreens = TripRequestPage();
  // ignore: unused_field
  String _currentTabName = 'হোম';
  // String _currentTabName = 'ট্রিপ রিকোয়েস্ট';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: DrawerComponent(),
      // ),
      // appBar: AppBar(
      //   title: KText(
      //     text: _currentTabName,
      //     fontSize: 20,
      //     color: white,
      //   ),
      // ),
      body: PageStorage(
        bucket: bucket,
        child: _currentScreens,
      ),
      bottomSheet: Container(
        color: white,
        height: 60,
        padding: paddingH20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customButton(
              onTap: () {
                setState(() {
                  _currentScreens = HomePage();
                  _currentTab = 1;
                  _currentTabName = 'হোম';
                  // _currentTabName = 'ট্রিপ রিকোয়েস্ট';
                });
              },
              iconData: Icons.home_outlined,
              // iconData: Icons.all_inclusive_outlined,
              color: _currentTab == 1 ? primaryColor : black54,
              title: 'হোম',
            ),
            customButton(
              onTap: () {
                setState(() {
                  _currentScreens = TripHistoryPage();
                  // _currentScreens = GariListPage();
                  _currentTab = 2;
                  // _currentTabName = 'ট্রিপসমূহ';
                  _currentTabName = 'চলমান ট্রিপ';
                  // _currentTabName = 'গাড়ি সমূহ';
                });
              },
              iconData: Icons.history,
              // iconData: Ionicons.car_outline,
              color: _currentTab == 2 ? primaryColor : black54,
              title: 'চলমান ট্রিপ',
            ),
            customButton(
              onTap: () {
                setState(() {
                  _currentScreens = OpekhomanBidPage();
                  _currentTab = 3;
                  _currentTabName = 'অপেক্ষমান বিড';
                });
              },
              iconData: Icons.mode_of_travel_outlined,
              color: _currentTab == 3 ? primaryColor : black54,
              title: 'অপেক্ষমান বিড',
            ),
            customButton(
              onTap: () {
                setState(() {
                  _currentScreens = MenuPage();

                  _currentTab = 4;
                  _currentTabName = 'মেনু';
                });
              },
              iconData: Icons.menu,
              title: 'মেনু',
              color: _currentTab == 4 ? primaryColor : black54,
            ),
          ],
        ),
      ),
    );
  }
}

customButton({
  required void Function()? onTap,
  required IconData iconData,
  required String title,
  required Color color,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        // width: 70,
        alignment: Alignment.center,
        // color: orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: color,
              size: 20,
            ),
            // SizedBox(height: 3),
            KText(
              text: title,
              fontSize: 12,
              color: color,
            ),
          ],
        ),
      ),
    );

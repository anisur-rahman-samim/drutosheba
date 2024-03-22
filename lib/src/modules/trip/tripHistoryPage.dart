import 'package:flutter/material.dart';
import '../../components/trip/tripVivoroniComponent.dart';
import '../../configs/appUtils.dart';

class TripHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          sizeH10,
          TripVivoroniComponent(),
        ],
      ),
    );
  }
}

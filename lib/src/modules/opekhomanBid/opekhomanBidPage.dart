import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:flutter/material.dart';

import '../../components/trip/opekhomanBidComponent.dart';

class OpekhomanBidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        sizeH10,
        OpekhomanBidComponent(),
        sizeH40,
        sizeH20,
      ]),
      // body: Center(
      //   child: KText(
      //     text: 'আপনার কোনো অপেক্ষমান বিড পাওয়া যায় নি',
      //   ),
      // ),
    );
  }
}

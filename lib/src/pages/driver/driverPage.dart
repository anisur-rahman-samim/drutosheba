import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/pages/driver/addNewDriverPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../configs/appColors.dart';
import '../../dummyData/rentalData.dart';
import '../../widgets/card/customCardWidget.dart';
import '../../widgets/text/kText.dart';

class DriverPage extends StatelessWidget {
  const DriverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'ড্রাইভার',
          fontSize: 20,
          color: white,
        ),
      ),

      body: ListView(
        children: [
          sizeH10,
          sizeH10,
          Padding(
            padding: paddingH10,
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: rentalData.length,
              itemBuilder: ((context, index) {
         
                return Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: CustomCardWidget(
                    radius: 10,
                    child: Padding(
                      padding: paddingH10V10,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: primaryColor50,
                            backgroundImage: AssetImage(
                              'assets/img/profile.png',
                            ),
                          ),
                          sizeW10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              KText(
                                text: 'Lorem Ipsum',
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                              KText(
                                text: '01771282104',
                                color: black45,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          sizeH20,
          sizeH40,
        ],
      ),
      // body: Padding(
      //   padding: paddingH20,
      //   child: Center(
      //     child: KText(
      //       text: '''আপনি কোনো ড্রাইভার এখনো যোগ করেন নি !
      //           নতুন ড্রাইভার যোগ করুন''',
      //       // fontSize: 14,
      //       textAlign: TextAlign.center,
      //       // color: black54,
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () => Get.to(
          AddNewDriverPage(),
        ),
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}

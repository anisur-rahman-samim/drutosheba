import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/dummyData/rentalData.dart';
import 'package:druto_seba_driver/src/modules/allGari/addNewGariPage.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'gariDetailsPage.dart';

class GariListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
        title: KText(
          text: 'আপনার গাড়ি সমূহ',
          fontSize: 18,
        ),
      ),

      backgroundColor: grey.shade100,
      body: Padding(
        padding: paddingH10,
        child: ListView(
          children: [
            sizeH10,
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 3,
              itemBuilder: ((context, index) {
                final item = rentalData[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: CustomCardWidget(
                    onTap: () => Get.to(() => GariDetailsPage(),transition: Transition.circularReveal),
                    radius: 10,
                    elevation: 0,
                    child: Padding(
                      padding: paddingH10,
                      child: Row(
                        children: [
                          Image.asset(
                            item.image,
                            height: 50,
                            width: 40,
                          ),
                          sizeW10,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 1.58,
                                    child: Row(
                                      children: [
                                        KText(
                                          text: item.title,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        sizeW5,
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.orange.shade400,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 7,
                                              vertical: 3,
                                            ),
                                            child: Center(
                                              child: KText(
                                                text: 'অ্যাপ্রুভ হয়নি',
                                                fontSize: 9,
                                                color: white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => Get.to(() => AddNewGariPage(
                                      isEditPage: true,
                                    ),transition: Transition.circularReveal),
                                    borderRadius: BorderRadius.circular(30),
                                    child: Padding(
                                      padding: paddingAll5,
                                      child: Icon(
                                        Icons.edit,
                                        color: blue,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  KText(
                                    text: 'Gg-55555',
                                    fontSize: 12,
                                    color: black54,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  sizeW5,
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor: grey,
                                  ),
                                  sizeW5,
                                  KText(
                                    text: 'NonAC',
                                    fontSize: 12,
                                    color: black54,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  sizeW5,
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor: grey,
                                  ),
                                  sizeW5,
                                  KText(
                                    text: '1-4 Seats',
                                    fontSize: 12,
                                    color: black54,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              sizeH5,
                              Row(
                                children: [
                                  KText(
                                    text: 'ঢাকা-মেট্রো-খ-55-55555',
                                    fontSize: 12,
                                    color: black54,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
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
            sizeH20,
            sizeH40,
          ],
        ),
      ),
      // body: Center(
      //   child: KText(
      //     text: 'কোনো গাড়ি এখনও যোগ হয়নি',
      //   ),
      // ),
      floatingActionButton: GestureDetector(
        onTap: () => Get.to(() => AddNewGariPage(),transition: Transition.circularReveal),
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: paddingH10V10,
            child: Icon(
              Icons.add,
              color: white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

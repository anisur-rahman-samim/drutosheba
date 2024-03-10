import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/appColors.dart';
import '../../widgets/text/kText.dart';

class LeaderBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: HexColor('#ebf2f8'),
      backgroundColor: greyBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: black,
        ),
        backgroundColor: white,
        title: KText(
          text: 'ড্যাশবোর্ড',
          fontSize: 18,
          color: black,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: paddingH10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.tune,
                        size: 15,
                        color: black,
                      ),
                      sizeW5,
                      KText(
                        text: 'ফিল্টার',
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          sizeW20,
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Container(
            color: grey.shade100,
            child: Padding(
              padding: paddingH20,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 15,
                      color: black54,
                    ),
                    sizeW10,
                    KText(
                      text: 'May 2022',
                      fontSize: 12,
                      color: black54,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      body: ListView(
        children: [
          sizeH10,
          CustomCardWidget(
            // height: 150,
            width: Get.width,
            color: white,
            radius: 0,
            elevation: .3,
            child: Padding(
              padding: paddingH20V10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      sizeH10,
                      KText(
                        text: '',
                        fontWeight: FontWeight.bold,
                      ),
                      sizeH5,
                      _cirleAvatar(
                        radius: 30,
                        cirleColor: blue,
                        count: 2,
                        countCirleRadius: 10,
                        imageSize: 30,
                      ),
                      sizeH20,
                      KText(
                        text: 'Md Foej',
                        fontSize: 12,
                      ),
                      sizeH5,
                      KText(
                        text: '৳81900',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/icon/kingIcon.png',
                        height: 20,
                      ),
                      sizeH5,
                      _cirleAvatar(
                        radius: 50,
                        cirleColor: Colors.orange,
                        count: 1,
                        countCirleRadius: 10,
                      ),
                      sizeH20,
                      KText(
                        text: 'S.M.Rony',
                        fontSize: 12,
                      ),
                      sizeH5,
                      KText(
                        text: '৳178317',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      sizeH10,
                      KText(
                        text: '',
                        fontWeight: FontWeight.bold,
                      ),
                      sizeH5,
                      _cirleAvatar(
                        radius: 30,
                        cirleColor: primaryColor,
                        count: 3,
                        countCirleRadius: 10,
                        imageSize: 30,
                      ),
                      sizeH20,
                      KText(
                        text: 'Md Sahidul',
                        fontSize: 12,
                      ),
                      sizeH5,
                      KText(
                        text: '৳55100',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          sizeH10,
          Container(
            color: white,
            child: Padding(
              padding: paddingH10,
              child: Column(
                children: [
                  sizeH20,
                  _listTile(
                    serialNumber: '4',
                    name: 'Abcd',
                    tk: '৳1234',
                  ),
                  sizeH10,
                  _listTile(
                    serialNumber: '5',
                    name: 'Abcd',
                    tk: '৳1234',
                  ),
                  sizeH10,
                  _listTile(
                    serialNumber: '6',
                    name: 'Abcd',
                    tk: '৳1234',
                  ),
                  sizeH10,
                  _listTile(
                    serialNumber: '7',
                    name: 'Abcd',
                    tk: '৳1234',
                  ),
                  sizeH10,
                  _listTile(
                    serialNumber: '8',
                    name: 'Abcd',
                    tk: '৳1234',
                  ),
                  sizeH10,
                  _listTile(
                    serialNumber: '9',
                    name: 'Abcd',
                    tk: '৳1234',
                  ),
                  sizeH10,
                  _listTile(
                    serialNumber: '10',
                    name: 'Abcd',
                    tk: '৳1234',
                  ),
                  sizeH20,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _cirleAvatar({
    required double radius,
    required Color cirleColor,
    required int count,
    required double countCirleRadius,
    double? imageSize,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: cirleColor,
          child: CircleAvatar(
            radius: radius - 2,
            backgroundColor: white,
            child: FlutterLogo(size: imageSize ?? 50),
          ),
        ),
        Positioned(
          bottom: -10,
          child: CircleAvatar(
            radius: countCirleRadius,
            backgroundColor: cirleColor,
            child: KText(
              text: '$count',
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: white,
            ),
          ),
        ),
      ],
    );
  }

  _listTile({
    required serialNumber,
    required name,
    required tk,
  }) {
    return CustomCardWidget(
      color: grey.shade100,
      elevation: 0,
      child: Padding(
        padding: paddingH20,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topRight,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        child: KText(
                          text: serialNumber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizeW10,
                      SizedBox(
                        width: 40,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: black,
                        ),
                      ),
                      sizeW20,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KText(
                            text: name,
                            fontSize: 14,
                          ),
                          sizeH5,
                          KText(
                            text: tk,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -18,
                  child: Image.asset(
                    'assets/icon/leaderBoardtopicon.png',
                    height: 30,
                  ),
                ),
                Positioned(
                  top: -12,
                  right: 7,
                  child: KText(
                    text: '$serialNumber',
                    fontSize: 13,
                    color: white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      radius: 10,
    );
  }
}

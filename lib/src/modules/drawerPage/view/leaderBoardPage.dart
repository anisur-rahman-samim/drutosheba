import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/modules/drawerPage/controller/leaderboard_controller.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../configs/appColors.dart';
import '../../../widgets/text/kText.dart';

class LeaderBoardPage extends StatefulWidget {
  @override
  State<LeaderBoardPage> createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  final LeaderboardController leaderboardController = Get.put(LeaderboardController());

  @override
  void initState() {
    leaderboardController.leaderboardDetails(month: DateTime.now().month.toString(), year: DateTime.now().year.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(leaderboardController.leaderboardList.length);
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

        body: Obx(() => leaderboardController.isLoading.value == true? CustomLoader(color: black, size: 30) : ListView(
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
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: leaderboardController.leaderboardList.length,
                        itemBuilder: (context,index){
                          return  Column(
                            children: [

                              index == 0?    Image.asset(
                                'assets/icon/kingIcon.png',
                                height: 20,
                              ): Text(""),
                              sizeH5,
                              _cirleAvatar(

                                  radius: index == 0? 50 : 30,
                                  cirleColor: index == 0? Colors.orange : blue,
                                  count: index == 0? 1 : 2,
                                  countCirleRadius: 10,
                                  image: leaderboardController.leaderboardList[index].getpartner!.image.toString()
                              ),
                              sizeH20,
                              KText(
                                text: leaderboardController.leaderboardList[index].getpartner?.name,
                                fontSize: 12,
                              ),
                              sizeH5,
                              KText(
                                text: '৳${leaderboardController.leaderboardList[index].totalSum}',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          );
                        }
                    ),
                  )
              ),
            ),
            sizeH10,
            leaderboardController.downRankLeader.isEmpty?SizedBox():    Container(
              color: white,
              child: Padding(
                  padding: paddingH10,
                  child: ListView.builder(
                      itemCount: leaderboardController.downRankLeader.length,

                      itemBuilder: (context,index){
                        return listTile(
                          serialNumber: "${index + 4}",
                          name: leaderboardController.downRankLeader[index].getpartner?.name,
                          tk: '৳${leaderboardController.downRankLeader[index].totalSum}',
                        );
                      }
                  )
              ),
            ),
          ],
        ),)
    );
  }

  _cirleAvatar({
    required double radius,
    required Color cirleColor,
    required int count,
    required double countCirleRadius,
    required String image,
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
            child: ClipOval(
              child: Image.network(
                Api.getImageURL(image),
                fit: BoxFit.fill,
               height: 200,
               // height: 20,
              ),
            ),
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

  listTile({
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

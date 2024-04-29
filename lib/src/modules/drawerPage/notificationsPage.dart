import 'package:druto_seba_driver/src/modules/drawerPage/controller/notfications_controller.dart';
import 'package:druto_seba_driver/src/services/notifications.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../widgets/card/customCardWidget.dart';
import '../../widgets/text/kText.dart';

class NotificationsPage extends StatelessWidget {
  final NotificationsController notificationsController = Get.put(NotificationsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'নোটিফিকেশন',
          fontSize: 20,
          color: white,
        ),
        actions: [
          IconButton(
            onPressed: () {
            notificationsController.deleteNotification();
            },
            icon: Icon(
              Icons.delete,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: paddingH20V20,
        child: Obx(() =>notificationsController.isLoading.value == true? CustomLoader(color: black, size: 30) :  ListView.builder(
            itemCount: notificationsController.notificationList.length,
            itemBuilder: (context,index){
              var item = notificationsController.notificationList[index];
              String originalDateString = item.createdAt.toString();
              DateTime originalDate = DateTime.parse(originalDateString);
              String formattedDate = DateFormat('dd MMM yyyy, hh:mm a').format(originalDate);


              return   Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                child: CustomCardWidget(
                  radius: 10,
                  // height: 100,
                  width: Get.width,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                            child: Icon(
                              Icons.notifications,
                              size: 30,
                            ),
                          ),
                          sizeW10,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                KText(
                                  text: item.title,
                                  fontWeight: FontWeight.bold,
                                ),
                                sizeH5,
                                KText(
                                  text:
                                  item.body,
                                  fontSize: 14,
                                  textAlign: TextAlign.justify,
                                  // maxLines: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: KText(
                          text: formattedDate,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: black45,
                          maxLines: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        ))
      ),
    );
  }
}

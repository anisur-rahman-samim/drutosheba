import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/modules/auth/controller/reviews_controller.dart';
import 'package:druto_seba_driver/src/modules/driver/edit_driver_page.dart';
import 'package:druto_seba_driver/src/modules/userAccount/controller/profile_controller.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/card/customCardWidget.dart';
import 'model/driver_model.dart';

class DriverDetailsView extends StatelessWidget {
  final Datum driver;
   DriverDetailsView({super.key, required this.driver});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.shade100,
        appBar: AppBar(
          title: KText(
            text: 'ড্রাইভার ডিটেলস',
            fontSize: 20,
            color: white,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: CustomCardWidget(
                onTap: () => Get.to(EditDriverPage(driver: driver,)),
                radius: 30,
                color: greyBackgroundColor,
                isPaddingHide: true,
                child: Row(
                  children: [
                    sizeW10,
                    Icon(
                      Icons.edit,
                      size: 20,
                      color: black,
                    ),
                    sizeW5,
                    KText(
                      text: 'এডিট ড্রাইভার',
                      fontSize: 14,
                    ),
                    sizeW10,
                  ],
                ),
              ),
            ),
            sizeW10
          ],
        ),
      body: Padding(
        padding: paddingH10,
        child: ListView(
          children: [
            sizeH10,
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: grey.shade300,
                  width: .9,
                ),
                color: white,
              ),
              child: Padding(
                padding: paddingH20V10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: white,
                      backgroundImage: NetworkImage(
                        Api.getImageURL(driver.image),
                      ),
                    ),
                    sizeW10,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text: driver.name,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        sizeH5,
                        KText(
                          text: driver.phone,
                          fontSize: 14,
                          color: black54,
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 3,
                        ),
                        child: KText(
                          text: '${driver.status} ',
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            sizeH20,
            _button(
              onTap: () {},
              icon: Icons.badge,
              cirleColor: Color.fromARGB(255, 255, 51, 0),
              title: 'ড্রাইভিং লাইসেন্স',
              subTitle: driver.drivingNo.toString(),
            ),
            sizeH10,
            _button(
              onTap: () {},
              icon: Icons.location_on_rounded,
              cirleColor: Color.fromARGB(255, 82, 14, 207),
              title: 'লোকেশন',
              subTitle: driver.contactNo.toString(),
            ),
            sizeH10,
            _button(
              onTap: () {},
              icon: Icons.map,
              cirleColor: null,
              title: 'ইমেইল',
              subTitle: driver.email.toString(),
            ),
            sizeH10,
            _button(
              onTap: () {},
              icon: Icons.transgender,
              cirleColor: Colors.green,
              title: 'লিঙ্গ',
              subTitle: driver.gender.toString(),
            ),
            sizeH10,
            CustomCardWidget(
              onTap: null,
              radius: 0,
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KText(
                    text: 'ড্রাইভার পেপার ছবি',
                    fontSize: 12,
                    color: black54,
                  ),
                  sizeH10,
                  Row(
                    children: [

                      Image.network(Api.getImageURL(driver.drivingImage),height: 70,width: 70,fit: BoxFit.fill,),
                      Image.network(Api.getImageURL(driver.nidFront),height: 70,width: 70,fit: BoxFit.fill,),
                      Image.network(Api.getImageURL(driver.nidBack),height: 70,width: 70,fit: BoxFit.fill,),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  _button({
    required void Function()? onTap,
    required IconData icon,
    required String title,
    required String subTitle,
    required Color? cirleColor,
    Widget? action,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: grey.shade300,
            width: .9,
          ),
          color: white,
        ),
        child: Padding(
          padding: paddingH10V10,
          child: Row(
            children: [
              CircleAvatar(
                radius: 13,
                backgroundColor: cirleColor,
                child: Icon(
                  icon,
                  color: white,
                  size: 15,
                ),
              ),
              sizeW10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title == ''
                      ? Container()
                      : KText(
                    text: '$title',
                    fontSize: 12,
                    color: grey,
                  ),
                  KText(
                    text: '$subTitle',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Spacer(),
              action ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}

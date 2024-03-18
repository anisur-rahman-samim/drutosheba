import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/modules/driver/controller/driver_controller.dart';
import 'package:druto_seba_driver/src/modules/driver/driver_details_view.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/loader/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../configs/appColors.dart';
import '../../dummyData/rentalData.dart';
import '../../widgets/card/customCardWidget.dart';
import '../../widgets/text/kText.dart';
import 'addNewDriverPage.dart';

class DriverPage extends StatelessWidget {
   DriverPage({Key? key}) : super(key: key);
  final DriverController driverController = Get.put(DriverController());

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

      body: Obx(() => driverController.isLoading.value == true? CustomLoader(color: black, size: 30): driverController.driverList.isEmpty? NoDataView() : Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: driverController.driverList.length,
          itemBuilder: ((context, index) {

            return Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: (){
                  Get.to(DriverDetailsView(driver: driverController.driverList[index],));
                },
                child: Stack(
                  children: [
                    CustomCardWidget(
                      radius: 10,
                      child: Padding(
                        padding: paddingH10V10,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: primaryColor50,
                              backgroundImage: NetworkImage(
                                Api.getImageURL(driverController.driverList[index].image.toString()),
                              ),
                            ),
                            sizeW10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                KText(
                                  text: driverController.driverList[index].name,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                                KText(
                                  text: driverController.driverList[index].phone,
                                  color: black45,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                        top: 10,
                        child: InkWell(
                            onTap: (){
                              driverController.driverDelete(driverId: driverController.driverList[index].id.toString());
                            },
                            child: CircleAvatar(radius: 15,backgroundColor: primaryColor, child: Icon(Icons.delete,color: Colors.white,size: 20,),))
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () => Get.to(() =>
            AddNewDriverPage(),
        ),
        child: Icon(
          Icons.add,
          size: 30,
          color: white,
        ),
      ),
    );
  }
}

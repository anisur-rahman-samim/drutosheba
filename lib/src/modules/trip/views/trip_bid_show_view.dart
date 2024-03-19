import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/modules/trip/controller/bid_show_controller.dart';
import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/loader/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TripBidShowView extends StatelessWidget {
   TripBidShowView({super.key});
  final BidShowController bidShowController = Get.put(BidShowController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bid Show",style: h2.copyWith(color: white),),
      ),
      body: Obx(() => bidShowController.isLoading.value == true? CustomLoader(color: black, size: 30) : bidShowController.tripBidsList.isEmpty? NoDataView() : ListView.builder(
          itemCount: bidShowController.tripBidsList.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
              child: CustomCardWidget(radius: 10, child: ListTile(
                leading: CircleAvatar(radius: 30,backgroundColor: primaryColor, child: Center(child: Text(bidShowController.tripBidsList[index].getpartner!.name![0].toUpperCase(),style: h1.copyWith(color: white),),),),
                title: Text(bidShowController.tripBidsList[index].getpartner!.name.toString(),style: h2,),
                subtitle: Text(bidShowController.tripBidsList[index].getpartner!.email.toString(),style: h4,),
                trailing: Text("${bidShowController.tripBidsList[index].amount} TK",style: h2.copyWith(color: primaryColor),),
              )),
            );
          }
      ))
    );
  }
}

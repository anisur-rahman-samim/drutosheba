import 'package:druto_seba_driver/src/modules/menu/controller/offer_controller.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:druto_seba_driver/src/widgets/loader/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/appColors.dart';
import '../../../configs/appUtils.dart';
import '../../../widgets/bottomSheet/customBottomSheet.dart';
import '../../../widgets/card/customCardWidget.dart';
import '../../../widgets/text/kText.dart';

class OfferPage extends StatelessWidget {
  final OffersController offersController = Get.put(OffersController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'অফার',
          fontSize: 20,
          color: white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Obx(() => offersController.isLoading.value == true? CustomLoader(color: black, size: 30) :offersController.offersList.isEmpty? NoDataView() : ListView.builder(
          itemCount: offersController.offersList.length,
          itemBuilder: (BuildContext context, int index) {
            return  GestureDetector(
              onTap: () => customBottomSheet(
                context: context,
                height: Get.width / .8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: Get.width / .9,
                    child: ListView(
                      shrinkWrap: true,
                      primary: false,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.network(
                                Api.getImageURL(offersController.offersList[index].image),
                                fit: BoxFit.cover,
                                width: Get.width,
                              ),
                            ),
                            sizeH10,
                            Padding(
                              padding: paddingH20,
                              child: KText(
                                text:
                                offersController.offersList[index].name,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            sizeH10,
                            Padding(
                              padding: paddingH20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        size: 20,
                                        color: Colors.black26,
                                      ),
                                      KText(
                                        text: offersController.offersList[index].startedAt,
                                        color: black54,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                  sizeH10,
                                  Padding(
                                    padding: paddingH20,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.expand_circle_down_sharp,
                                          size: 20,
                                          color: Colors.black26,
                                        ),
                                        KText(
                                          text: offersController.offersList[index].expiredAt,
                                          color: black54,
                                          fontSize: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            sizeH20,
                            Padding(
                              padding: paddingH20,
                              child: Center(
                                child: KText(
                                  text: offersController.offersList[index].description,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              child: CustomCardWidget(
                radius: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.network(
                        Api.getImageURL(offersController.offersList[index].image),
                        fit: BoxFit.cover,
                        height: 150,
                        width: Get.width,
                      ),
                    ),
                    sizeH10,
                    Padding(
                      padding: paddingH20,
                      child: KText(
                        text:
                        offersController.offersList[index].name,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: paddingH20,
                      child: KText(
                        text:
                        offersController.offersList[index].description,
                        color: black45,
                        fontSize: 14,
                        maxLines: 3,
                      ),
                    ),
                    sizeH10,
                    Padding(
                      padding: paddingH20,
                      child: Row(
                        children: [
                          Icon(
                            Icons.timer,
                            size: 20,
                            color: Colors.black26,
                          ),
                          KText(
                            text: offersController.offersList[index].startedAt,
                            color: black54,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                    sizeH10,
                    Padding(
                      padding: paddingH20,
                      child: Row(
                        children: [
                          Icon(
                            Icons.expand_circle_down_sharp,
                            size: 20,
                            color: Colors.black26,
                          ),
                          KText(
                            text: offersController.offersList[index].expiredAt,
                            color: black54,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                    sizeH20,
                  ],
                ),
              ),
            );
          },

        ),)
      ),
    );
  }
}

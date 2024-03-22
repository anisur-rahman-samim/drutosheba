import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/modules/menu/controller/offer_controller.dart';
import 'package:druto_seba_driver/src/modules/menu/model/offer_model.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferDetails extends StatelessWidget {
   final  Offers offers;
   OfferDetails({super.key, required this.offers});

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
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: Get.width / .9,
          child: ListView(
            shrinkWrap: true,
            primary: false,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.network(
                        Api.getImageURL(offers.image),
                        fit: BoxFit.cover,
                        width: Get.width,
                      ),
                    ),
                    sizeH10,
                    Padding(
                      padding: paddingH20,
                      child: KText(
                        text:
                        offers.name,
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
                                text: offers.startedAt,
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
                                  text: offers.expiredAt,
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
                          text: offers.description,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

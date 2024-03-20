
import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../configs/appColors.dart';
import '../../../../configs/appUtils.dart';
import '../../../../widgets/card/customCardWidget.dart';
import '../../../../widgets/text/kText.dart';
import '../../controller/location_controller.dart';

class ReturnTripLocationSelect extends StatefulWidget {
   ReturnTripLocationSelect({super.key});

  @override
  State<ReturnTripLocationSelect> createState() => _ReturnTripLocationSelectState();
}

class _ReturnTripLocationSelectState extends State<ReturnTripLocationSelect> {
  final LocationController locationController = Get.put(LocationController());

  final TextEditingController pickUpTextController = TextEditingController();

  final TextEditingController dropTextController = TextEditingController();
  @override
  void initState() {
/*    locationController.pickUpLocation.value = '';
    locationController.dropLocation.value = '';*/
    pickUpTextController.text = locationController.pickUpLocation.value == "পিকআপ" ? "" :locationController.pickUpLocation.toString();
    dropTextController.text = locationController.dropLocation.value == "গন্তব্য"?"": locationController.dropLocation.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: KText(
        text: 'রিটার্ন ট্রিপ',
        color: white,
        fontSize: 18,
      ),),
      body: CustomCardWidget(
        radius: 0,
        elevation: 0,
        child: Obx(() => SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizeH10,
                KText(
                  text: 'আপনার লোকেশন ও গন্তব্য প্ৰদান করুন',
                  fontSize: 14,
                  color: black54,
                ),
                sizeH20,
                SizedBox(
                  height: 150,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset("assets/img/pick.png",scale: 12,),
                          sizeH5,
                          Container(
                            height: 50,
                            width: .5,
                            color: grey,
                          ),
                          sizeH5,
                          Image.asset("assets/img/map.png",scale: 12,),
                        ],
                      ),
                      sizeW20,
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 65,
                              child: TextField(
                                controller: pickUpTextController,
                                onChanged: (value){
                                //  locationController.suggestionsDrop.clear();
                                  value.isEmpty? locationController.fetchPickSuggestions("Bangladesh")
                                      : locationController.fetchPickSuggestions(value);
                                },
                              //  maxLength: 10,

                                decoration: InputDecoration(
                                    border: InputBorder.none,

                                    hintText: 'পিকআপ',

                                    counterText: '',
                                    //  contentPadding: EdgeInsetsGeometry
                                    labelStyle: TextStyle(
                                      color: black54,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide.none

                                    ),

                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide:  BorderSide.none
                                    ),
                                    fillColor: greyBackgroundColor,
                                    filled: true
                                ),
                              //  inputFormatters: [LengthLimitingTextInputFormatter(12)],
                              ),
                            ),
                            sizeH10,
                            SizedBox(
                              height: 65,
                              child: TextField(
                                controller: dropTextController,
                                onChanged: (value){
                                //  locationController.suggestionsPickUp.clear();
                                  value.isEmpty? locationController.fetchDropSuggestions("Bangladesh")
                                      : locationController.fetchDropSuggestions(value);
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'গন্তব্য',
                                 // counterText: '',
                                  //  contentPadding: EdgeInsetsGeometry
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none

                                  ),
                                    labelStyle: TextStyle(
                                      color: black54,
                                    ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:  BorderSide.none
                                  ),
                                    fillColor: greyBackgroundColor,
                                  filled: true
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                sizeH10,
                locationController.isLoading.value == true? Center(child: SpinKitDoubleBounce(
                  color: primaryColor,
                  size: 50.0,
                ),): locationController.suggestionsPickUp.isNotEmpty
                    ? SizedBox(
                  height: Get.height,
                      child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: locationController.suggestionsPickUp.length,
                                      physics: ScrollPhysics(),
                                      itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(locationController.suggestionsPickUp[index].description,style: h3,),
                        onTap: () {
                          pickUpTextController.text = locationController.suggestionsPickUp[index].description;
                          locationController.selectPikUpAddress(locationController.suggestionsPickUp[index]);

                          locationController.suggestionsPickUp.clear();

                        },
                      );
                                      },
                                    ),
                    )
                    : Container(),



                locationController.isLoadingDrop.value == true? Center(child: SpinKitDoubleBounce(
                  color: primaryColor,
                  size: 50.0,
                ),): locationController.suggestionsDrop.isNotEmpty
                    ? SizedBox(
                  height: Get.height,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: locationController.suggestionsDrop.length,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(locationController.suggestionsDrop[index].description,style: h3,),
                        onTap: () {
                          dropTextController.text = locationController.suggestionsDrop[index].description;
                          locationController.selectDropAddress(locationController.suggestionsDrop[index]);

                          locationController.suggestionsDrop.clear();
                          Get.back();

                        },
                      );
                    },
                  ),
                )
                    : Container(),
              ],
            ),
          ),
        ),)
      ),
    );
  }
}

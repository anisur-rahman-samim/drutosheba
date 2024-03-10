import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/modules/trip/views/return_trip_location_select.dart';
import 'package:druto_seba_driver/src/widgets/formField/customFormField.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/appUtils.dart';
import '../../dummyData/rentalData.dart';
import '../../widgets/bottomSheet/customBottomSheet.dart';
import '../../widgets/card/customCardWidget.dart';
import '../../widgets/formField/dropDownForm.dart';
import 'controller/location_controller.dart';
import 'controller/return_trip_controller.dart';
import 'returnTripHistoryPage.dart';
import 'package:intl/intl.dart';

class ReturnTripPage extends StatelessWidget {
  final ReturnTripController returnTripController = Get.put(ReturnTripController());
  final LocationController locationController = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'রিটার্ন ট্রিপ',
          color: white,
          fontSize: 18,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: CustomCardWidget(
              onTap: () => Get.to(() => ReturnTripHistoryPage(),transition: Transition.circularReveal),
              radius: 30,
              color: greyBackgroundColor,
              isPaddingHide: true,
              child: Row(
                children: [
                  sizeW10,
                  Icon(
                    Icons.access_time_filled_outlined,
                    size: 20,
                    color: black,
                  ),
                  sizeW5,
                  KText(
                    text: 'সকল ট্রিপ',
                    fontSize: 14,
                  ),
                  sizeW10,
                ],
              ),
            ),
          ),
          sizeW10,
        ],
      ),
      backgroundColor: greyBackgroundColor,
      body: Obx(() => ListView(
        children: [
          InkWell(
            onTap: () =>  Get.to(() => ReturnTripLocationSelect(),transition: Transition.circularReveal),
            child: CustomCardWidget(
              radius: 0,
              elevation: 0,
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
                    height: 100,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.location_pin,
                              size: 15,
                            ),
                            sizeH5,
                            Container(
                              height: 50,
                              width: .5,
                              color: grey,
                            ),
                            sizeH5,
                            Icon(
                              Icons.location_pin,
                              size: 15,
                            ),
                          ],
                        ),
                        sizeW20,
                        Expanded(
                          child: Column(
                            children: [
                              /*customFormField(
                                height: 45,
                                isFilled: true,
                                hintText: 'পিকআপ',
                                hintTextSize: 12,
                                isHintText: true,
                                filledColor: greyBackgroundColor,
                                isHideBorder: true,
                              ),*/
                              Container(
                                height: 45,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: greyBackgroundColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Text(locationController.pickUpLocation.value,style: TextStyle(
                                      color: black54,
                                      fontSize: 12,

                                    ),
                                    ),
                                  ),
                                ),
                              ),
                              sizeH10,
                              Container(
                                height: 45,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: greyBackgroundColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Text(locationController.dropLocation.value,style: TextStyle(
                                      color: black54,
                                      fontSize: 12,

                                    ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizeH10,
                ],
              ),
            ),
          ),
          sizeH10,
          CustomCardWidget(
            radius: 0,
            elevation: 0,
            child: Column(
              children: [
                _button(
                  onTap: () {
                    BottomPicker.date(
                      title: 'তারিখ সিলেক্ট করুন',
                      dateOrder: DatePickerDateOrder.dmy,
                      //initialDateTime: DateTime(1996, 10, 22),
                      initialDateTime: DateTime(2024),
                      maxDateTime: DateTime(2024, 04, 07),
                      minDateTime: DateTime(2024),
                      pickerTextStyle: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      titleStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                      onChange: (index) {
                        print(index.toString());
                      },
                      onSubmit: (index) {
                        print(index.toString());
                        String inputTime = index.toString();
                        DateTime timeObj = DateTime.parse(inputTime);
                        //  String outputTime = DateFormat("hh:mma").format(timeObj);
                        String outputTime = DateFormat("dd MMM yyyy").format(timeObj);
                        print(outputTime);

                        returnTripController.dateSelected.value = outputTime;

                      },
                      bottomPickerTheme: BottomPickerTheme.plumPlate,
                      buttonStyle: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.blue[200]!,
                        ),
                      ),
                      buttonWidth: 200,
                      buttonContent: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Select date',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ).show(context);
                  },
                  title: returnTripController.dateSelected.value,
                  icon: Icons.calendar_month,
                ),
                Divider(),
                _button(
                  onTap: () {

                    BottomPicker.time(
                      title: 'Set your next meeting time',
                      titleStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: primaryColor,
                      ),
                      onSubmit: (index) {
                        print(index);
                        String inputTime = index.toString();
                        DateTime timeObj = DateTime.parse(inputTime);
                        String outputTime = DateFormat("hh:mma").format(timeObj);
                        print(outputTime);
                        returnTripController.timeSelected.value = outputTime;
                      },
                      onClose: () {
                        print('Picker closed');
                      },
                      bottomPickerTheme: BottomPickerTheme.blue,
                      //use24hFormat: true,
                      initialTime: Time(
                        hours: DateTime.now().hour,
                        minutes: DateTime.now().minute,
                      ),
                     /* maxTime: Time(
                        hours: 17,
                      ),*/
                    ).show(context);
                  },
                  title: returnTripController.timeSelected.value,
                  icon: Icons.access_time_outlined,
                ),
                Divider(),
                _button(
                  onTap: () {
                    dropDownForm(
                      onTap: () => customBottomSheet(
                        context: context,
                        height: Get.height / 1.4,
                        child: ListView(
                          shrinkWrap: true,
                          primary: false,
                          children: [
                            Center(
                              child: KText(
                                text: 'গাড়ি নির্বাচন করুন',
                                fontSize: 18,
                              ),
                            ),
                            Divider(),
                            sizeH10,
                            Container(
                              height: Get.height / 1.7,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: rentalData.length,
                                  itemBuilder: (c, i) {
                                    final item = rentalData[i];
                                    return InkWell(
                                      borderRadius:
                                      BorderRadius.circular(5),
                                      onTap: () {

                                        returnTripController.selectedCar.value =
                                            item.title.toString();
                                        returnTripController.selectedCarCapacity.value =
                                            item.description.toString();
                                        returnTripController.selectedCarImage.value =
                                            item.image.toString();
                                        Get.back();

                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              item.image.toString(),
                                              width: 50,
                                              // width: Get.width / 6,
                                            ),
                                            sizeW20,
                                            SizedBox(
                                              width: Get.width / 1.5,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  KText(
                                                    text: item.title,
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                  SizedBox(width: 3),
                                                  KText(
                                                    text: item.description,
                                                    fontSize: 12,
                                                    color: black45,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            CircleAvatar(
                                              radius: 10,
                                              backgroundColor:
                                              returnTripController.selectedCar.value == item.title
                                                  ? primaryColor
                                                  : grey,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                returnTripController.selectedCar.value ==
                                                    item.title
                                                    ? primaryColor
                                                    : white,
                                                radius: 9,
                                                child: returnTripController.selectedCar.value ==
                                                    item.title
                                                    ? Icon(
                                                  Icons.done,
                                                  size: 15,
                                                  color: white,
                                                )
                                                    : null,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      title: '',
                      hintText: returnTripController.selectedCar.value.isNotEmpty
                          ? returnTripController.selectedCar.value
                          : 'গাড়ির ধরণ',
                      requiredText: '*',
                    );
                  },
                  title: 'গাড়ি সিলেক্ট করুন',
                  icon: Icons.local_taxi_outlined,
                ),
              ],
            ),
          ),
          sizeH10,
          CustomCardWidget(
            radius: 0,
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KText(
                  text: 'ভাড়া ডিমান্ড করুন',
                  fontSize: 14,
                ),
                sizeH10,
                customFormField(
                  height: 45,
                  isFilled: true,
                  hintText: 'আপনার ডিমান্ডকৃত ভাড়া',
                  hintTextSize: 14,
                  isHintText: true,
                  filledColor: greyBackgroundColor,
                  isHideBorder: true,
                  contentPadding: paddingH10,
                ),
                sizeH20,
                CustomCardWidget(
                  radius: 30,
                  color: primaryColor,
                  elevation: 0,
                  width: Get.width,
                  child: Center(
                    child: KText(
                      text: 'ট্রিপ পাবলিশ করুন',
                      fontSize: 14,
                      color: white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),)
    );
  }

  _button({
    required Function()? onTap,
    required String? title,
    required IconData? icon,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5),
      child: Padding(
        padding: paddingH10V10,
        child: Row(
          children: [
            Icon(
              icon,
            ),
            sizeW20,
            KText(
              text: title,
            ),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_down,
              color: grey,
            ),
          ],
        ),
      ),
    );
  }
}

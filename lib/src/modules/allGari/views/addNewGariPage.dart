import 'package:dotted_border/dotted_border.dart';
import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/dummyData/rentalData.dart';
import 'package:druto_seba_driver/src/modules/allGari/controller/fual_controller.dart';
import 'package:druto_seba_driver/src/modules/allGari/controller/vehicles_brand_controller.dart';
import 'package:druto_seba_driver/src/modules/allGari/views/addNewgari1Page.dart';
import 'package:druto_seba_driver/src/network/api/api.dart';
import 'package:druto_seba_driver/src/widgets/button/primaryButton.dart';
import 'package:druto_seba_driver/src/widgets/formField/dropDownForm.dart';
import 'package:druto_seba_driver/src/widgets/formField/requiredForm.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:druto_seba_driver/src/modules/allGari/model/vehicles_brand_model.dart';
import '../../../widgets/bottomSheet/customBottomSheet.dart';
import '../model/fual_model.dart';

class AddNewGariPage extends StatefulWidget {
  final bool? isEditPage;
  AddNewGariPage({
    this.isEditPage = false,
  });
  @override
  State<AddNewGariPage> createState() => _AddNewGariPageState();
}

class _AddNewGariPageState extends State<AddNewGariPage> {
  final VehiclesBrandController vehiclesBrandController = Get.put(VehiclesBrandController());
  final FualController fualController = Get.put(FualController());

  String airCondition = 'এসি';
  String selectedNidOrLicense = 'এনআইডি';

  final carNo = TextEditingController();

  var selectedCar = RxString('');
  bool? isNextButton = false;
  var isCarInfo = true;

  var selectedCarImage = '';
  var selectedCarCapacity = '';

  var vehiclesName = '';
  var fualName = '';

  @override
  void initState() {
    isNextButton = widget.isEditPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
        title: KText(
          text: 'নতুন গাড়ি যুক্ত করুন',
          fontSize: 18,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 10,
                      color: grey.shade100,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isCarInfo = true;
                        });
                      },
                      borderRadius: BorderRadius.circular(5),
                      child: Padding(
                        padding: paddingH10V10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Ionicons.car,
                              color: isCarInfo != true ? black54 : primaryColor,
                              size: 20,
                            ),
                            sizeW5,
                            KText(
                              text: 'গাড়ির বিস্তারিত',
                              fontSize: 14,
                              color: black54,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: isNextButton == false
                          ? null
                          : () {
                              setState(() {
                                if (isNextButton == true) {
                                  isCarInfo = false;
                                }
                              });
                            },
                      borderRadius: BorderRadius.circular(5),
                      child: Padding(
                        padding: paddingH10V10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Ionicons.camera,
                              color: isCarInfo == true ? black54 : primaryColor,
                              size: 20,
                            ),
                            sizeW5,
                            KText(
                              text: 'গাড়ির ছবি',
                              fontSize: 14,
                              color: black54,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 3,
                      color: isCarInfo != true ? grey.shade100 : primaryColor,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 3,
                      color: isCarInfo == true ? grey.shade100 : primaryColor,
                    ),
                  ),
                ],
              ),
              sizeH10,
              Padding(
                padding: paddingH20,
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor('#fef4e1'),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: paddingH10V10,
                    child: Row(
                      children: [
                        Icon(
                          Icons.info,
                          size: 18,
                        ),
                        sizeW10,
                        KText(
                          text: 'গ্রাহক এসকল তথ্য দেখতে পাবে',
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: isNextButton == true && isCarInfo == false
          ? AddNewGari1Page()
          : ListView(
              children: [
                sizeH10,
                Padding(
                  padding: paddingH20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Obx(
                        () => dropDownForm(
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
                                      itemCount: vehiclesBrandController.vehiclesBrandList.length,
                                      itemBuilder: (c, i) {
                                        final item = vehiclesBrandController.vehiclesBrandList[i];
                                        return InkWell(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          onTap: () {
                                            setState(() {
                                              selectedCar.value =
                                                  item.name.toString();
                                              selectedCarCapacity =
                                                  item.capacity.toString();
                                              selectedCarImage =
                                                  item.image.toString();
                                              Get.back();
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                               /* Image.asset(
                                                  Api.getImageURL(item.image.toString(),),
                                                  width: 50,
                                                  // width: Get.width / 6,
                                                ),*/
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
                                                        text: item.name,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      SizedBox(width: 3),
                                                      KText(
                                                        text: item.capacity,
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
                                                      selectedCar.value == item.name
                                                          ? primaryColor
                                                          : grey,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        selectedCar.value ==
                                                                item.name
                                                            ? primaryColor
                                                            : white,
                                                    radius: 9,
                                                    child: selectedCar.value ==
                                                            item.name
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
                          hintText: selectedCar.value.isNotEmpty
                              ? selectedCar.value
                              : 'গাড়ির ধরণ',
                          requiredText: '*',
                        ),
                      ),
                      sizeH10,
                      Obx(
                            () => SizedBox(
                          height: 45,
                          child: DropdownButtonFormField<FualList>(
                            value: fualController.fualList.isNotEmpty
                                ? fualController.fualList[0]
                                : null,
                            items: fualController.fualList.map((fuallist) {
                              return DropdownMenuItem<FualList>(
                                value: fuallist,
                                child: Text(
                                  fuallist.name!,
                                  style: TextStyle(
                                    color: black54,
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (FualList? newValue) {
                              setState(() {
                                fualName = newValue!.name!;
                              });
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 14),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1, color: grey.shade200)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1, color: grey.shade200)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1, color: grey.shade200)),
                            ),
                          ),
                        ),
                      ),
                      requiredForm(
                        title: 'ব্র্যান্ড এর নাম',
                        hintText: 'ব্র্যান্ড এর নাম',
                        requiredText: '*',
                      ),
                      sizeH10,
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: dropDownForm(
                              onTap: () {},
                              title: '',
                              hintText: 'ঢাকা মেট্রো',
                              requiredText: '',
                            ),
                          ),
                          sizeW5,
                          dropDownForm(
                            width: 65,
                            onTap: () {},
                            title: '',
                            hintText: 'ব',
                            requiredText: '',
                          ),
                          sizeW5,
                          requiredForm(
                            controller: carNo,
                            onChanged: (_) {},
                            // contentPaddingHide: true,
                            width: 90,
                            title: '',
                            hintText: 'xx-xxxx',
                            requiredText: '',
                          ),
                        ],
                      ),
                      sizeH10,
                      Row(
                        children: [
                          Expanded(
                            child: requiredForm(
                              title: 'মডেলের নাম',
                              hintText: 'মডেল',
                              requiredText: '*',
                            ),
                          ),
                          sizeW20,
                          Expanded(
                            child: requiredForm(
                              title: 'মডেল এর বছর',
                              hintText: 'মডেল এর বছর',
                              requiredText: '*',
                            ),
                          ),
                        ],
                      ),
                      sizeH10,
                      requiredForm(
                        title: 'গাড়ির রং',
                        hintText: 'গাড়ির রং',
                        requiredText: '*',
                      ),
                      sizeH20,
                    ],
                  ),
                ),
                Obx(
                  () => Column(
                    children: [
                      selectedCar.value == 'Truck' ? sizeW10 : sizeH10,
                      selectedCar.value == 'Truck'
                          ? sizeW10
                          : Column(
                              children: [
                                Container(
                                  height: 5,
                                  color: grey.shade100,
                                ),
                                sizeH10,
                                Padding(
                                  padding: paddingH20,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: KText(
                                          text: 'এয়ার কন্ডিশন',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      sizeW10,
                                      Expanded(
                                        child: primaryButton(
                                          buttonName: 'এসি',
                                          fontSize: 12,
                                          onTap: () {
                                            setState(() {
                                              airCondition = 'এসি';
                                            });
                                          },
                                          textColor: airCondition == 'এসি'
                                              ? white
                                              : primaryColor,
                                          height: 40,
                                          color: airCondition == 'এসি'
                                              ? primaryColor
                                              : white,
                                          borderColor: airCondition == 'এসি'
                                              ? white
                                              : grey,
                                        ),
                                      ),
                                      sizeW10,
                                      Expanded(
                                        child: primaryButton(
                                          buttonName: 'নন-এসি',
                                          fontSize: 12,
                                          textColor: airCondition == 'নন-এসি'
                                              ? white
                                              : primaryColor,
                                          onTap: () {
                                            setState(() {
                                              airCondition = 'নন-এসি';
                                            });
                                          },
                                          height: 40,
                                          color: airCondition == 'নন-এসি'
                                              ? primaryColor
                                              : white,
                                          borderColor: airCondition == 'নন-এসি'
                                              ? white
                                              : grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                sizeH10,
                                Container(
                                  height: 5,
                                  color: grey.shade100,
                                ),
                              ],
                            ),
                      selectedCar.value == 'Truck' ? sizeW10 : sizeH20,
                    ],
                  ),
                ),
                sizeH20,
                Padding(
                  padding: paddingH20,
                  child: primaryButton(
                    height: 45,
                    buttonName: 'পরবর্তী ধাপ',
                    fontSize: 14,
                    onTap: () {
                      setState(() {
                        isNextButton = true;
                        isCarInfo = false;
                      });
                    },
                  ),
                ),
                sizeH30,
              ],
            ),
    );
  }

  Widget roundedRectBorderWidget({void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: grey.shade300,
        dashPattern: [5, 3],
        radius: Radius.circular(10),
        // padding: EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          child: Container(
            height: 100,
            width: Get.width,
            child: Icon(
              Icons.add_a_photo_outlined,
              size: 30,
              color: grey.shade400,
            ),
          ),
        ),
      ),
    );
  }
}

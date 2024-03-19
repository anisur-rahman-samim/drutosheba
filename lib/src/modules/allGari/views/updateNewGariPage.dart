import 'package:dotted_border/dotted_border.dart';
import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/dummyData/rentalData.dart';
import 'package:druto_seba_driver/src/modules/allGari/controller/fual_controller.dart';
import 'package:druto_seba_driver/src/modules/allGari/controller/vehicles_brand_controller.dart';
import 'package:druto_seba_driver/src/modules/allGari/controller/vehicles_controller.dart';
import 'package:druto_seba_driver/src/modules/allGari/views/addNewgari1Page.dart';
import 'package:druto_seba_driver/src/modules/allGari/views/updateNewgari1Page.dart';
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
import '../controller/metro_controller.dart';
import '../model/fual_model.dart';
import '../model/vehicles_model.dart';

class UpdateNewGariPage extends StatefulWidget {
  final bool? isEditPage;
  final Vehicles? vehicles;
  UpdateNewGariPage({
    this.isEditPage = false, this.vehicles,
  });

  @override
  State<UpdateNewGariPage> createState() => _UpdateNewGariPageState();
}

class _UpdateNewGariPageState extends State<UpdateNewGariPage> {
  final VehiclesBrandController vehiclesBrandController = Get.put(VehiclesBrandController());
  final FualController fualController = Get.put(FualController());
  final MetroController metroController = Get.put(MetroController());


  String airCondition = 'এসি';
  String selectedNidOrLicense = 'এনআইডি';

  final TextEditingController carNoController = TextEditingController();
  final TextEditingController brandNameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController modelYearController = TextEditingController();
  final TextEditingController colorController = TextEditingController();

  var selectedCar = RxString('');
  var selectedCarId = RxString('');
  var selectedMetro = RxString('');
  var selectedMetroSubId = RxString('');
  var selectedMetroSub = RxString('');
  bool? isNextButton = false;
  var isCarInfo = true;

  var selectedCarImage = '';
  var selectedCarCapacity = '';

  var vehiclesName = '';
  var fualName = '';

  @override
  void initState() {
    isNextButton = widget.isEditPage;
    carNoController.text = widget.vehicles!.metroNo.toString();
    modelController.text = widget.vehicles!.model.toString();
    modelYearController.text = widget.vehicles!.modelYear.toString();
    colorController.text = widget.vehicles!.vehicleColor.toString();
    selectedCar.value = widget.vehicles!.getbrand!.name.toString();
    selectedMetro.value = widget.vehicles!.metro.toString();

    airCondition = widget.vehicles!.aircondition.toString();


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
          ? UpdateNewGari1Page(
        carName: selectedCarId.value,
        fualName: fualName,
        brandName: brandNameController.text,
        metroName: selectedMetro.value,
        subMetroName: selectedMetroSubId.value,
        metroNumber: carNoController.text,
        modelName: modelController.text,
        modelYear: modelYearController.text,
        colorName: colorController.text,
        airCondition: airCondition,
        vehicles: widget.vehicles,
      )
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
                                              selectedCarId.value =
                                                  item.id.toString();
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
                          hintText: selectedCar.value,
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
                        controller: brandNameController,
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
                              onTap: () {
                                customBottomSheet(
                                  context: context,
                                  height: Get.height / 1.4,
                                  child: ListView(
                                    shrinkWrap: true,
                                    primary: false,
                                    children: [
                                      Center(
                                        child: KText(
                                          text: 'মেট্রো নির্বাচন করুন',
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
                                            itemCount: metroController.metroList.length,
                                            itemBuilder: (c, i) {
                                              final item = metroController.metroList[i];
                                              return InkWell(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                onTap: () {
                                                  setState(() {
                                                    selectedMetro.value =
                                                        item.metroName.toString();
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
                                                      KText(
                                                        text: item.metroName,
                                                        fontSize: 14,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                      Spacer(),
                                                      CircleAvatar(
                                                        radius: 10,
                                                        backgroundColor:
                                                        selectedMetro.value == item.metroName
                                                            ? primaryColor
                                                            : grey,
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                          selectedMetro.value ==
                                                              item.metroName
                                                              ? primaryColor
                                                              : white,
                                                          radius: 9,
                                                          child: selectedMetro.value ==
                                                              item.metroName
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
                                );
                              },
                              title: '',
                              hintText: selectedMetro.value.isNotEmpty
                                  ? selectedMetro.value
                                  : 'ঢাকা মেট্রো',
                              requiredText: '',
                            ),
                          ),
                          sizeW5,
                          dropDownForm(
                            width: 65,
                            onTap: () {
                              customBottomSheet(
                                context: context,
                                height: Get.height / 1.4,
                                child: ListView(
                                  shrinkWrap: true,
                                  primary: false,
                                  children: [
                                    Center(
                                      child: KText(
                                        text: 'মেট্রো নির্বাচন করুন',
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
                                          itemCount: metroController.metroSubList.length,
                                          itemBuilder: (c, i) {
                                            final item = metroController.metroSubList[i];
                                            return InkWell(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              onTap: () {
                                                setState(() {
                                                  selectedMetroSubId.value =
                                                      item.id.toString();
                                                  selectedMetroSub.value =
                                                      item.metroSubName.toString();
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
                                                    KText(
                                                      text: item.metroSubName,
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                    Spacer(),
                                                    CircleAvatar(
                                                      radius: 10,
                                                      backgroundColor:
                                                      selectedMetroSub.value == item.metroSubName
                                                          ? primaryColor
                                                          : grey,
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                        selectedMetroSub.value ==
                                                            item.metroSubName
                                                            ? primaryColor
                                                            : white,
                                                        radius: 9,
                                                        child: selectedMetroSub.value ==
                                                            item.metroSubName
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
                              );
                            },
                            title: '',
                            hintText: selectedMetroSub.value.isNotEmpty
                                ? selectedMetroSub.value
                                :  'ব',
                            requiredText: '',
                          ),
                          sizeW5,
                          requiredForm(
                            controller: carNoController,
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
                              controller: modelController,
                              title: 'মডেলের নাম',
                              hintText: 'মডেল',
                              requiredText: '*',
                            ),
                          ),
                          sizeW20,
                          Expanded(
                            child: requiredForm(
                              controller: modelYearController,
                              title: 'মডেল এর বছর',
                              hintText: 'মডেল এর বছর',
                              requiredText: '*',
                            ),
                          ),
                        ],
                      ),
                      sizeH10,
                      requiredForm(
                        controller: colorController,
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

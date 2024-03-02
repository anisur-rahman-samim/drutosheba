import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/widgets/button/primaryButton.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/formField/customFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/appColors.dart';
import '../../widgets/text/kText.dart';
import 'paymentTypePage.dart';

class CreditPage extends StatefulWidget {
  @override
  State<CreditPage> createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
  TextEditingController creditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackgroundColor,
      appBar: AppBar(
        title: KText(
          text: 'ক্রেডিট',
          fontSize: 20,
          color: white,
        ),
      ),
      body: Padding(
        padding: paddingH10V10,
        child: ListView(
          children: [
            CustomCardWidget(
              radius: 1,
              elevation: .5,
              // height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomCardWidget(
                    radius: 10,
                    elevation: .2,
                    borderColor: Colors.green,
                    color: Colors.green.shade50.withOpacity(.5),
                    child: Row(
                      children: [
                        KText(
                          text: 'মোট ক্রেডিট',
                          fontSize: 14,
                          color: black,
                          fontWeight: FontWeight.w600,
                        ),
                        Spacer(),
                        KText(
                          text: '500',
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ],
                    ),
                  ),
                  sizeH10,
                  Row(
                    children: [
                      Expanded(
                        child: CustomCardWidget(
                          radius: 10,
                          color: Colors.indigo,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: white,
                                child: Icon(
                                  Icons.credit_card,
                                  color: Colors.indigo,
                                ),
                              ),
                              sizeH40,
                              KText(
                                text: '500',
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: white,
                              ),
                              sizeH5,
                              KText(
                                text: 'অব্যবহৃত ক্রেডিট',
                                fontSize: 14,
                                color: white,
                                fontWeight: FontWeight.w600,
                              ),
                              sizeH20,
                            ],
                          ),
                        ),
                      ),
                      sizeW20,
                      Expanded(
                        child: CustomCardWidget(
                          radius: 10,
                          color: Colors.deepOrange,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: white,
                                child: Icon(
                                  Icons.card_giftcard_outlined,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              sizeH40,
                              KText(
                                text: '500',
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: white,
                              ),
                              sizeH5,
                              KText(
                                text: 'অব্যবহৃত ক্রেডিট',
                                fontSize: 14,
                                color: white,
                                fontWeight: FontWeight.w600,
                              ),
                              sizeH20,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sizeH10,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCardWidget(
                  radius: 5,
                  // height: 100,
                  width: Get.width,
                  child: Padding(
                    padding: paddingH10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text: 'ক্রেডিট কিনুন',
                          fontSize: 14,
                          color: black,
                        ),
                        sizeH5,
                        Divider(),
                        sizeH5,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            primaryButton(
                              height: 20,
                              width: 35,
                              radius: 30,
                              buttonName: '100',
                              onTap: () {
                                setState(() {
                                  creditController.text = '100';
                                });
                              },
                            ),
                            sizeW5,
                            primaryButton(
                              radius: 30,
                              height: 20,
                              width: 35,
                              buttonName: '200',
                              onTap: () {
                                setState(() {
                                  creditController.text = '200';
                                });
                              },
                            ),
                            sizeW5,
                            primaryButton(
                              height: 20,
                              radius: 30,
                              width: 35,
                              buttonName: '300',
                              onTap: () {
                                setState(() {
                                  creditController.text = '300';
                                });
                              },
                            ),
                            sizeW5,
                            primaryButton(
                              radius: 30,
                              height: 20,
                              width: 35,
                              buttonName: '500',
                              onTap: () {
                                setState(() {
                                  creditController.text = '500';
                                });
                              },
                            ),
                          ],
                        ),
                        sizeH10,
                        Row(
                          children: [
                            Expanded(
                              child: customFormField(
                                controller: creditController,
                                hintText: 'লিখুন',
                                height: 45,
                                outlineColor: grey.shade200,
                              ),
                            ),
                            sizeW10,
                            Expanded(
                              child: primaryButton(
                                height: 45,
                                width: 50,
                                buttonName: 'পরবর্তী',
                                onTap: () => Get.to(PaymentTypePage()),
                              ),
                            ),
                          ],
                        ),
                        // sizeH5,
                        // Divider(),
                        // sizeH5,
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: KText(
                        //     text: '* ১ ক্রেডিট = ১ টাকা',
                        //     fontSize: 16,
                        //     color: primaryColor,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                sizeH10,
                CustomCardWidget(
                  radius: 5,
                  width: Get.width,
                  child: Padding(
                    padding: paddingH10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text: 'ক্রেডিট হিস্ট্রি',
                          fontSize: 14,
                          color: black,
                        ),
                        sizeH20,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List<Widget>.generate(
                            3,
                            (index) => Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: CustomCardWidget(
                                radius: 10,
                                color: greyBackgroundColor,
                                elevation: 0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    KText(
                                      text: 'Registration bonus credit',
                                      fontSize: 16,
                                      color: black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    sizeH10,
                                    Row(
                                      children: [
                                        KText(
                                          text: '05:20 PM, 26 May 2022',
                                          color: black45,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        Spacer(),
                                        KText(
                                          text: '+500',
                                          color: Colors.green,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

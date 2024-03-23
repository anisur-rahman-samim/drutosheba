import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/modules/credit/controller/credit_controller.dart';
import 'package:druto_seba_driver/src/modules/credit/paymentTypePage.dart';
import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:druto_seba_driver/src/widgets/button/primaryButton.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/formField/customFormField.dart';
import 'package:druto_seba_driver/src/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyCredit extends StatefulWidget {
  const BuyCredit({super.key});

  @override
  State<BuyCredit> createState() => _BuyCreditState();
}

class _BuyCreditState extends State<BuyCredit> {
  TextEditingController creditController = TextEditingController();
  final CreditController creditDataController = Get.put(CreditController());
  @override
  void initState() {
  //  creditDataController.getCredit();
    creditDataController.getCreditHistory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ক্রেডিট কিনুন",style: h2.copyWith(color: white),),
        centerTitle: true,
      ),
      body: CustomCardWidget(
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
              SizedBox(
                height: 40,
                child: ListView(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
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
                      onTap: () => Get.to(() => PaymentTypePage(),transition: Transition.circularReveal),
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
    );
  }
}

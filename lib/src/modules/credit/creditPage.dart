import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/modules/credit/buy_creadit.dart';
import 'package:druto_seba_driver/src/modules/credit/controller/credit_controller.dart';
import 'package:druto_seba_driver/src/services/text_styles.dart';
import 'package:druto_seba_driver/src/widgets/button/primaryButton.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:druto_seba_driver/src/widgets/formField/customFormField.dart';
import 'package:druto_seba_driver/src/widgets/loader/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../configs/appColors.dart';
import '../../widgets/text/kText.dart';
import 'paymentTypePage.dart';

class CreditPage extends StatefulWidget {
  @override
  State<CreditPage> createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
  final CreditController creditDataController = Get.put(CreditController());
  @override
  void initState() {
    creditDataController.getCredit();
    creditDataController.getCreditHistory();
    super.initState();
  }
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
        /*actions: [
          InkWell(
              onTap: (){
                Get.to(() => BuyCredit());
              },
              child: Text("ক্রেডিট কিনুন",style: h2.copyWith(color: white),)),
          sizeW20
        ],*/
      ),
      body: Obx(() => creditDataController.isLoading.value == true? CustomLoader(color: black, size: 30) : Padding(
        padding: paddingH10V10,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCardWidget(
                  onTap: (){
                    Get.to(() => BuyCredit());
                  },
                  width: Get.width / 2.2,
                  height: Get.height / 6,
                  radius: 10,
                  color: Colors.deepOrange,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: white,
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.deepOrange,
                            ),
                          ),
                          sizeW10,
                          KText(
                            text:  "ক্রেডিট \nকিনুন",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: white,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),



                    ],
                  ),
                ),
                sizeH10,
                CustomCardWidget(
                  radius: 10,
                  width: Get.width / 2.2,
                  height: Get.height / 6,
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: white,
                            child: Icon(
                              Icons.credit_card,
                              color: Colors.indigo,
                            ),
                          ),
                          sizeW10,
                          KText(
                            text: "${creditDataController.credit.value.data?.currentCredit.toString()} \nক্রেডিট",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: white,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),

                      KText(
                        text: 'বর্তমান ক্রেডিট',
                        fontSize: 14,
                        color: white,
                        fontWeight: FontWeight.w600,
                      ),

                    ],
                  ),
                ),





              ],
            ),
            sizeH10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                CustomCardWidget(
                  radius: 10,
                  width: Get.width / 2.2,
                  height: Get.height / 6,
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: white,
                            child: Icon(
                              Icons.credit_card,
                              color: Colors.indigo,
                            ),
                          ),
                          sizeW10,
                          KText(
                            text: "${creditDataController.credit.value.data?.currentBalance} \nক্রেডিট",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: white,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),

                      KText(
                        text: 'মোট ক্রেডিট',
                        fontSize: 14,
                        color: white,
                        fontWeight: FontWeight.w600,
                      ),

                    ],
                  ),
                ),
                sizeH10,
                CustomCardWidget(
                  width: Get.width / 2.2,
                  height: Get.height / 6,
                  radius: 10,
                  color: Colors.deepOrange,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     Row(
                       children: [
                         CircleAvatar(
                           backgroundColor: white,
                           child: Icon(
                             Icons.card_giftcard_outlined,
                             color: Colors.deepOrange,
                           ),
                         ),
                         sizeW10,
                         KText(
                           text:  "${creditDataController.credit.value.data?.currentBonus.toString()} \nক্রেডিট",
                           fontWeight: FontWeight.bold,
                           fontSize: 20,
                           color: white,
                           textAlign: TextAlign.center,
                         ),
                       ],
                     ),

                      KText(
                        text: 'বোনাস ক্রেডিট',
                        fontSize: 14,
                        color: white,
                        fontWeight: FontWeight.w600,
                      ),

                    ],
                  ),
                ),



              ],
            ),
            sizeH10,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

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
                        SizedBox(
                          height: Get.height / 2,
                          child: ListView.builder(
                            itemCount: creditDataController.creditHistoryList.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index){
                                String dateTimeString = creditDataController.creditHistoryList[index].createdAt.toString();
                                DateTime dateTime = DateTime.parse(dateTimeString);
                                String formattedDateTime = DateFormat('hh:mm a, dd MMM yyyy').format(dateTime);
                                return Padding(
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
                                          text: creditDataController.creditHistoryList[index].name,
                                          fontSize: 16,
                                          color: black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        sizeH10,
                                        Row(
                                          children: [
                                            KText(
                                              text: formattedDateTime,
                                              color: black45,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            Spacer(),
                                            KText(
                                              text: '${creditDataController.creditHistoryList[index].type == "credit" || creditDataController.creditHistoryList[index].type == "bonus"? "+": "-" } ${creditDataController.creditHistoryList[index].amount}',
                                              color: creditDataController.creditHistoryList[index].type == "credit" || creditDataController.creditHistoryList[index].type == "bonus"?  Colors.green : Colors.red,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),)
    );
  }
}

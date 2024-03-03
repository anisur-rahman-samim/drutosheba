import 'package:flutter/material.dart';

import '../../../configs/appColors.dart';
import '../../../configs/appUtils.dart';
import '../../../widgets/card/customCardWidget.dart';
import '../../../widgets/formField/customFormField.dart';
import '../../../widgets/text/kText.dart';

class ReturnTripLocationSelect extends StatefulWidget {
  const ReturnTripLocationSelect({super.key});

  @override
  State<ReturnTripLocationSelect> createState() => _ReturnTripLocationSelectState();
}

class _ReturnTripLocationSelectState extends State<ReturnTripLocationSelect> {
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
                        customFormField(
                          height: 45,
                          isFilled: true,
                          hintText: 'পিকআপ',
                          hintTextSize: 12,
                          isHintText: true,
                          filledColor: greyBackgroundColor,
                          isHideBorder: true,
                        ),
                        sizeH10,
                        customFormField(
                          height: 45,
                          isFilled: true,
                          hintText: 'গন্তব্য',
                          hintTextSize: 12,
                          isHintText: true,
                          filledColor: greyBackgroundColor,
                          isHideBorder: true,
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
    );
  }
}

import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:druto_seba_driver/src/widgets/card/customCardWidget.dart';
import 'package:flutter/material.dart';

import '../../configs/appColors.dart';
import '../../widgets/text/kText.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackgroundColor,
      appBar: AppBar(
        title: KText(
          text: 'সাহায্য',
          fontSize: 20,
          color: white,
        ),
      ),
      body: ListView(
        children: [
          sizeH20,
          Image.asset(
            'assets/img/help.png',
            height: 100,
            width: 100,
          ),
          sizeH20,
          CustomCardWidget(
            elevation: .2,
            radius: 0,
            child: Padding(
              padding: paddingH20V20,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(
                        text: 'কল সেন্টার (7am-11:59pm)',
                        color: black,
                        fontWeight: FontWeight.bold,
                      ),
                      KText(
                        text: '09642080808',
                        fontSize: 14,
                        color: black45,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: black,
                    child: Icon(
                      Icons.call,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          sizeH5,
          CustomCardWidget(
            elevation: .2,
            radius: 0,
            child: Padding(
              padding: paddingH20V20,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(
                        text: 'ইমেইল',
                        color: black,
                        fontWeight: FontWeight.bold,
                      ),
                      KText(
                        text: 'support@drutosheba.co',
                        fontSize: 14,
                        color: black45,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: black,
                    child: Icon(
                      Icons.email_outlined,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          sizeH5,
          CustomCardWidget(
            elevation: .2,
            radius: 0,
            child: Padding(
              padding: paddingH20V20,
              child: Row(
                children: [
                  KText(
                    text: 'এপ কিভাবে ব্যবহার করবেন',
                    color: black,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: black,
                    child: CircleAvatar(
                      radius: 21,
                      backgroundColor: white,
                      child: Icon(
                        Icons.smart_display_rounded,
                        color: black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

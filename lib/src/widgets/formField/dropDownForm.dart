import 'package:flutter/material.dart';
import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../text/kText.dart';

Widget dropDownForm({
  required void Function()? onTap,
  required String title,
  required hintText,
  required requiredText,
  double? width,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          title == ''
              ? Container()
              : Row(
                  children: [
                    KText(
                      text: title,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    KText(
                      text: ' $requiredText',
                      fontSize: 16,
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
          sizeH10,
          Container(
            height: 45,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: grey.shade200,
              ),
            ),
            child: Padding(
              padding: paddingH10,
              child: Row(
                children: [
                  KText(
                    text: hintText,
                    fontSize: 14,
                    color: black45,
                  ),
                  Spacer(),
                  Icon(
                    Icons.expand_more,
                    color: black45,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

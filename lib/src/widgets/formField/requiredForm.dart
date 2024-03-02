import 'package:flutter/material.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../text/kText.dart';

requiredForm({
// required void Function()? onTap,
  required title,
  String? hintText,
  String? labelText,
  required requiredText,
  double? width,
  bool? isTitleHide,
  // IconData? suffixIcon,
  bool? contentPaddingHide,
  TextEditingController? controller,
  void Function(String)? onChanged,
  int? maxLength,
}) =>
    Column(
      children: [
        isTitleHide == true
            ? Row(
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
              )
            : Container(),
        isTitleHide == true ? sizeW10 : sizeH10,
        SizedBox(
          height: 45,
          width: width,
          child: TextFormField(
            controller: controller ?? TextEditingController(),
            onChanged: onChanged,
            showCursor: true,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: grey.shade200,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: grey.shade200,
                ),
              ),
              // suffixIcon: Icon(
              //   suffixIcon,
              //   size: 15,
              //   color: black45,
              // ),
              contentPadding: contentPaddingHide == true
                  ? EdgeInsets.symmetric(horizontal: 3, vertical: 0)
                  : paddingH10,

              hintText: labelText != null ? null : hintText,
              labelText: labelText,
              hintStyle: TextStyle(
                fontSize: 14,
                color: black45,
              ),
              labelStyle: TextStyle(
                fontSize: 14,
                color: black45,
              ),
            ),
          ),
        ),
      ],
    );

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/appColors.dart';
import '../text/kText.dart';

Widget primaryButton({
  required buttonName,
  required void Function()? onTap,
  double? height,
  double? width,
  double? radius,
  Color? color,
  Color? textColor,
  Color? borderColor,
  double? fontSize,
  double? elevation,
  Widget? child,
}) =>
    ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? transparent),
            borderRadius: BorderRadius.circular(
              radius != null ? radius : 30,
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          color ?? primaryColor,
        ),
      ),
      child: SizedBox(
        height: height ?? 50,
        width: width ?? Get.width,
        child: Center(
          child: child ??
              KText(
                text: buttonName,
                color: textColor ?? white,
                fontSize: fontSize ?? 16,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );

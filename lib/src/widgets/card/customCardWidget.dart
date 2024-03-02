import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:druto_seba_driver/src/configs/appUtils.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;
  final double? elevation;
  final double? height;
  final double? width;
  final double? borderWidth;

  final bool? isRadiusOff;

  final void Function()? onTap;

  final Color? color;
  final Color? borderColor;

  final double radius;

  final bool? isPaddingHide;

  CustomCardWidget({
    required this.radius,
    required this.child,
    this.elevation,
    this.height,
    this.width,
    this.borderWidth,
    this.onTap,
    this.isRadiusOff,
    this.color,
    this.borderColor,
    this.isPaddingHide,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: .5,
      margin: EdgeInsets.all(0),
      elevation: elevation == null ? 1 : elevation,
      shape: isRadiusOff == true
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),

      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: borderColor ?? transparent,
              width: borderWidth ?? 1,
            ),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Padding(
            padding: isPaddingHide == true ? EdgeInsets.zero : paddingH10V10,
            child: child,
          ),
        ),
      ),
    );
  }
}

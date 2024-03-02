import 'dart:ui';

import 'package:druto_seba_driver/src/configs/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

globalDialog({
  required Widget? child,
  barrierDismissible = true,
  var padding = const EdgeInsets.symmetric(vertical: 20),
  bool? isBackgroundBlur = false,
}) {
  var context = Get.context as BuildContext;
  showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (_) {
        return isBackgroundBlur == true
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Dialog(
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: padding,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        child ?? Container(),
                      ],
                    ),
                  ),
                ),
              )
            : Dialog(
                backgroundColor: Colors.white,
                child: Padding(
                  padding: padding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                    
                          child ?? Container(),
                          Positioned(
                            right: 10,
                            top: -10,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: primaryColor50,
                              child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                splashRadius: .2,
                                icon: Icon(
                                  Icons.close,
                                  color: primaryColor,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
      });
}

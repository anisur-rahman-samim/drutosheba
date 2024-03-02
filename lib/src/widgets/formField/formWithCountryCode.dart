import 'package:flutter/material.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../text/kText.dart';

formWithCountryCode({
  required hintText,
}) {
  return SizedBox(
    height: 55,
    child: TextFormField(
      // controller: numberTextC,
      maxLength: 11,

      autovalidateMode: AutovalidateMode.always,
      keyboardType: TextInputType.number,

      decoration: InputDecoration(
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: grey.shade300,
          ),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 10),
          child: SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizeW10,
                Image.asset(
                  'assets/img/bdFlag.png',
                  width: 35,
                ),
                sizeW10,
                KText(
                  text: '+88',
                  color: black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                sizeW10,
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Container(
                    width: 1,
                    // height: 50,
                    color: grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ),
        contentPadding: EdgeInsets.only(left: 5),
        hintText: hintText,
        hintStyle: TextStyle(
          color: black45,
        ),
      ),
    ),
  );
}

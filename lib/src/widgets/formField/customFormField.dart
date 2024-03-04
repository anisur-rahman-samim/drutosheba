import 'package:flutter/material.dart';
import 'package:druto_seba_driver/src/configs/appColors.dart';

customFormField({
  hintText,
  bool isPassword = false,
  TextInputType? keyboardType,
  bool isNumberField = false,
  double? height,
  Color? outlineColor,
  TextEditingController? controller,
  bool isFilled = false,
  Color? filledColor,
  bool? isHideBorder = false,
  double? hintTextSize,
  bool? isHintText = false,
  Function(String)? onChanged,
  EdgeInsetsGeometry? contentPadding,
}) {
  return SizedBox(
    height: height,
    child: TextFormField(
      controller: controller ?? TextEditingController(),
      onChanged: onChanged,
    //  maxLines: 1,
      obscureText: isPassword == false ? false : true,
      keyboardType: keyboardType,
      maxLength: isNumberField == false ? null : 11,
      decoration: InputDecoration(
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: isHideBorder == true
              ? BorderSide.none
              : BorderSide(
                  color: outlineColor != null ? outlineColor : grey.shade400,
                ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: isHideBorder == true
              ? BorderSide.none
              : BorderSide(
                  color: transparent,
                ),
        ),
        contentPadding: contentPadding,
        fillColor: filledColor,
        filled: isFilled,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: isHideBorder == true
              ? BorderSide.none
              : BorderSide(
                  color: outlineColor != null ? outlineColor : grey.shade400,
                ),
        ),
        hintText: isHintText == true ? hintText : '',
        hintStyle: TextStyle(
          color: black54,
          fontSize: hintTextSize,
        ),
        labelText: isHintText == true ? null : hintText,
        labelStyle: TextStyle(
          color: black54,
          fontSize: hintTextSize,
        ),
      ),
    ),
  );
}

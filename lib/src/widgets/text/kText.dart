// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../configs/appColors.dart';

class KText extends StatelessWidget {
  final String ?text;
  final Color? color;
  final double? fontSize;

  // final String? fontFamily;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? wordSpacing;
  final double? letterSpacing;

  final TextDirection? textDirection;
  final TextDecoration? decoration;

  KText({
    required this.text,
    this.color,
    this.fontSize,
    // this.fontFamily,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDirection,
    this.wordSpacing,
    this.letterSpacing,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text'.tr,
      // style: GoogleFonts.balooDa2(
      style: TextStyle(
        
        decoration: decoration,
        fontSize: fontSize != null ? fontSize : 16,
        fontWeight: fontWeight,
        color: color != null ? color : black,
        wordSpacing: wordSpacing,
        letterSpacing: letterSpacing,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      textDirection: textDirection,
    );
  }
}

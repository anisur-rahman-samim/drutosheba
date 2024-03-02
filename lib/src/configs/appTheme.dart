import 'package:flutter/material.dart';

import 'appColors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: white,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: white,
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:medrecords/config/const.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColor.seaBlue,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColor.darkGray,
      appBarTheme: const AppBarTheme(backgroundColor: AppColor.offBlack));
}

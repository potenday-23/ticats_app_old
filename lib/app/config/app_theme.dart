import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';

abstract class AppTheme {
  AppTheme._();

  static final ThemeData defaultTheme = ThemeData(
    fontFamily: 'SUIT',
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      scrolledUnderElevation: 0,
      titleSpacing: 0,
      toolbarHeight: 54.h,
    ),
    scaffoldBackgroundColor: AppGrayscale.gray85,
  );
}

import 'package:flutter/material.dart';
import 'package:ticats/app/index.dart';

abstract class AppTheme {
  AppTheme._();

  static final ThemeData defaultTheme = ThemeData(
    fontFamily: 'SUIT',
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      scrolledUnderElevation: 0,
      titleSpacing: 0,
      toolbarHeight: 54,
    ),
    scaffoldBackgroundColor: AppGrayscale.gray85,
  );
}

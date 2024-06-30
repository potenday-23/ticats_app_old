import 'package:flutter/material.dart';

abstract class AppColor {
  AppColor._();

  // Primary
  static const Color primaryNormal = Color(0xFFA277FF);
  static const Color primaryLight = Color(0xFFB68BFF);
  static const Color primaryDark = Color(0xFF8247FF);

  // Secondary
  static const Color secondaryNormal = Color(0xFFF5F378);

  // Point
  static const Color pointNormal = Color(0xFFFF6F0F);

  // Static
  static const Color white = Colors.white;
  static const Color black = Color(0xFF242424);

  // System
  static const Color positiveGreen = Color(0xFF30D158);
  static const Color positiveBlue = Color(0xFF007AFF);
  static const Color positiveBlueBg = Color(0xFFEDF3FF);
  static const Color error = Color(0xFFEB271C);
  static const Color errorBg = Color(0xFFFFEDF0);
}

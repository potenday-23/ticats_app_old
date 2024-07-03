import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';

abstract class AppTypeface {
  AppTypeface._();

  // Title
  static final TextStyle title28Medium = TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w500, height: 1.57, color: AppColor.black);
  static final TextStyle title26Semibold = TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w600, height: 1.38, color: AppColor.black);

  // Headline
  static final TextStyle headline24Bold = TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700, height: 1.5, color: AppColor.black);
  static final TextStyle headline24Medium = TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, height: 1.41, color: AppColor.black);

  // Body
  static final TextStyle body20Bold = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, height: 1.5, color: AppColor.black);
  static final TextStyle body18Bold = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, height: 1.55, color: AppColor.black);
  static final TextStyle body18Semibold = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, height: 1.55, color: AppColor.black);

  // Label
  static final TextStyle label20Bold = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, height: 1.3, color: AppColor.black);
  static final TextStyle label16Bold = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, height: 1.625, color: AppColor.black);
  static final TextStyle label16Semibold = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, height: 1.625, color: AppColor.black);
  static final TextStyle label16Medium = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, height: 1.625, color: AppColor.black);
  static final TextStyle label16Regular = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, height: 1.625, color: AppColor.black);
  static final TextStyle label14Bold = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700, height: 1.57, color: AppColor.black);
  static final TextStyle label14Medium = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, height: 1.57, color: AppColor.black);
  static final TextStyle label12Bold = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, height: 1.5, color: AppColor.black);
  static final TextStyle label12Regular = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, height: 1.5, color: AppColor.black);
}

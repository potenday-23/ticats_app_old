import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticats/app/index.dart';

class TicatsUnderlineTextField extends HookConsumerWidget {
  TicatsUnderlineTextField({
    required this.hintText,
    required this.controller,
    this.status = TextFieldStatus.normal,
    this.statusText = "",
    this.keyboardType = TextInputType.text,
    this.isEnable = true,
    this.maxLength,
    this.onChanged,
    super.key,
  });

  final String hintText;
  final TextEditingController controller;

  final TextFieldStatus status;
  final String statusText;
  final TextInputType keyboardType;

  final Function(String)? onChanged;

  final bool isEnable;
  final int? maxLength;

  final int id = UniqueKey().hashCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color textColor = status == TextFieldStatus.error
        ? AppColor.error
        : status == TextFieldStatus.info
            ? AppColor.positiveBlue
            : AppGrayscale.gray60;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            isDense: true,
            enabled: isEnable,
            contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            hintText: hintText,
            hintStyle: AppTypeface.label16Semibold.copyWith(color: AppGrayscale.gray70),
            border: const UnderlineInputBorder(borderSide: BorderSide(color: AppGrayscale.gray55)),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppGrayscale.gray55)),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppGrayscale.gray55)),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(maxLength),
          ],
          style: AppTypeface.label16Semibold.copyWith(color: isEnable ? AppColor.black : AppGrayscale.gray70),
          keyboardType: keyboardType,
        ),
        SizedBox(height: 4.h),
        if (statusText.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(statusText, style: AppTypeface.label12Regular.copyWith(color: textColor)),
          ),
        ],
      ],
    );
  }
}

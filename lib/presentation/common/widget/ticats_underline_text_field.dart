import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticats/app/index.dart';

final _inputTextProvider = StateProvider.family<String, int>((ref, id) => '');

class TicatsUnderlineTextField extends HookConsumerWidget {
  TicatsUnderlineTextField({
    required this.hintText,
    required this.controller,
    this.status = TextFieldStatus.normal,
    this.statusText = "",
    this.keyboardType = TextInputType.text,
    super.key,
  });

  final String hintText;
  final TextEditingController controller;

  final TextFieldStatus status;
  final String statusText;
  final TextInputType keyboardType;

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
          onChanged: (value) => ref.read(_inputTextProvider(id).notifier).state = value,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            hintText: hintText,
            hintStyle: AppTypeface.label16Semibold.copyWith(color: AppGrayscale.gray70),
            border: const UnderlineInputBorder(borderSide: BorderSide(color: AppGrayscale.gray55)),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppGrayscale.gray55)),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppGrayscale.gray55)),
          ),
          style: AppTypeface.label16Semibold.copyWith(color: AppColor.black),
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

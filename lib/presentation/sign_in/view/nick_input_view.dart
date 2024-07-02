import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/presentation/index.dart';

class NickInputView extends ConsumerWidget {
  const NickInputView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController textController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text("닉네임", style: AppTypeface.label16Semibold.copyWith(color: AppColor.black)),
        ),
        SizedBox(height: 10.h),
        TicatsBorderTextField(
          hintText: "티케팅하는 고양이",
          controller: textController,
          maxLength: 10,
        ),
      ],
    );
  }
}

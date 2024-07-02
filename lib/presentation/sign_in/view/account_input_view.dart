import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/presentation/index.dart';

class AccountInputView extends ConsumerWidget {
  const AccountInputView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text("이메일", style: AppTypeface.label16Semibold),
        ),
        SizedBox(height: 10.h),
        TicatsUnderlineTextField(hintText: "ticats1020@gmail 형식으로 작성해주세요.", controller: TextEditingController()),
        SizedBox(height: 56.h),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text("생년월일", style: AppTypeface.label16Semibold),
        ),
        SizedBox(height: 10.h),
        TicatsUnderlineTextField(hintText: "생년월일 6자리를 입력해주세요.", controller: TextEditingController(), keyboardType: TextInputType.number),
        SizedBox(height: 56.h),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/presentation/index.dart';

class SelectGenderView extends ConsumerWidget {
  const SelectGenderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text("성별", style: AppTypeface.label16Semibold.copyWith(color: AppColor.black)),
        ),
        SizedBox(height: 26.h),
        Row(
          children: [
            Expanded(
              child: TicatsChipButton(
                text: "남",
                onPressed: () {},
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: TicatsChipButton(
                isEnabled: false,
                text: "여",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}

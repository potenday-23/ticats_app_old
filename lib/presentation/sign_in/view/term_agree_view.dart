import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/presentation/index.dart';

class TermAgreeView extends ConsumerWidget {
  const TermAgreeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 31.h),
              child: Text("약관동의", style: AppTypeface.body20Bold),
            ),
            Row(
              children: [
                TicatsCheckbox(onChanged: (val) {}),
                SizedBox(width: 10.w),
                Text("모두 동의합니다.", style: AppTypeface.label16Bold),
              ],
            ),
            SizedBox(height: 4.h),
            for (TermEnum term in TermEnum.values) ...[
              _TermAgreeCheckBox(term),
            ],
            SizedBox(height: 25.h),
            TicatsCTAButton.contained(
              text: "다음",
              onPressed: () {
                showTicatsTwoButtonDialog(
                  context,
                  child: Text(
                    "마케팅 정보 수신 및 이용에 동의하면,\n문화생활 알림을 받을 수 있어요!",
                    style: AppTypeface.label16Regular,
                    textAlign: TextAlign.center,
                  ),
                  text: "알림 받기",
                  onPressed: () {},
                );
              },
              size: ButtonSize.large,
            ),
            SizedBox(height: 13.h),
          ],
        ),
      ),
    );
  }
}

class _TermAgreeCheckBox extends ConsumerWidget {
  const _TermAgreeCheckBox(this.term);

  final TermEnum term;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        TicatsCheckbox(
          onChanged: (val) {},
        ),
        SizedBox(width: 10.w),
        Text(term.text, style: AppTypeface.label16Regular),
        SizedBox(width: 8.w),
        if (term.isRequired) ...[
          Text("(필수)", style: AppTypeface.label16Semibold.copyWith(color: AppColor.primaryNormal)),
        ] else ...[
          Text("(선택)", style: AppTypeface.label16Semibold.copyWith(color: AppGrayscale.gray60)),
        ],
        const Spacer(),
        Text("내용보기 >", style: AppTypeface.label14Bold.copyWith(color: AppGrayscale.gray40)),
      ],
    );
  }
}

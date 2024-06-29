import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticats/app/index.dart';

import 'package:widgetbook/widgetbook.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

enum SSOType {
  kakao("카카오", "kakao", Color(0xFFFFE300)),
  google("Google", "google", Colors.white),
  apple("Apple", "apple", Colors.black, Colors.white);

  final String label;
  final String icon;
  final Color bgColor;
  final Color textColor;

  const SSOType(this.label, this.icon, this.bgColor, [this.textColor = Colors.black]);
}

class TicatsSSOButton extends StatelessWidget {
  const TicatsSSOButton({
    super.key,
    required this.type,
    required this.onPressed,
  });

  final SSOType type;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 56.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(color: type.bgColor, borderRadius: AppRadius.medium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset('assets/logos/${type.icon}.svg')),
            SizedBox(width: 8.w),
            Text("${type.label}로 시작하기", style: AppTypeface.body18Semibold.copyWith(color: type.textColor)),
          ],
        ),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: "SSO",
  type: TicatsSSOButton,
  path: "[Ticats]/Button",
)
TicatsSSOButton enabledContainedButton(BuildContext context) {
  return TicatsSSOButton(
    type: context.knobs.list(label: "SSO Type", options: SSOType.values, initialOption: SSOType.kakao),
    onPressed: () {},
  );
}

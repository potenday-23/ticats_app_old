import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticats/app/config/app_radius.dart';
import 'package:ticats/app/config/app_typeface.dart';

enum SSOType {
  kakao("카카오", "kakao", Color(0xFFFFE300)),
  google("구글", "google", Colors.white);

  final String korName;
  final String engName;
  final Color color;

  const SSOType(this.korName, this.engName, this.color);
}

class TicatsSSOButton extends StatelessWidget {
  const TicatsSSOButton({
    super.key,
    required this.type,
    required this.hasIcon,
    required this.onPressed,
  });

  final SSOType type;
  final bool hasIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 56.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(color: type.color, borderRadius: AppRadius.medium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasIcon) ...[
              SizedBox(
                width: 50.w,
                child: Center(child: SvgPicture.asset('assets/icons/logo/${type.engName}.svg')),
              ),
              SizedBox(width: 8.w),
            ],
            Text("${type.korName} 로그인", style: AppTypeface().body18Semibold),
          ],
        ),
      ),
    );
  }
}

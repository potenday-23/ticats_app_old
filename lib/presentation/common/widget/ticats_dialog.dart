import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/gen/assets.gen.dart';

showTicatsDialog(
  BuildContext context, {
  required Widget child,
  required VoidCallback onPressed,
  text = "확인",
  bool barrierDismissible = true,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return Dialog(
        child: _TicatsDialog(child, text: text, onPressed: onPressed),
      );
    },
  );
}

showTicatsTwoButtonDialog(
  BuildContext context, {
  required Widget child,
  required VoidCallback onPressed,
  text = "확인",
  bool barrierDismissible = true,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return Dialog(
        child: _TicatsTwoButtonDialog(child, text: text, onPressed: onPressed),
      );
    },
  );
}

showTicatsWelcomeDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      final BuildContext storedContext = context;

      Future.delayed(const Duration(seconds: 3), () {
        if (Navigator.canPop(storedContext)) {
          Navigator.pop(storedContext);
        }
      });

      return Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          decoration: BoxDecoration(color: Colors.white, borderRadius: AppRadius.large),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("티캣츠에 오신 것을 환영합니다!", style: AppTypeface.body18Bold),
              SizedBox(height: 16.h),
              Assets.images.celebrate.svg(width: 100.w, height: 100.w),
            ],
          ),
        ),
      );
    },
  );
}

class _TicatsDialog extends ConsumerWidget {
  const _TicatsDialog(
    this.child, {
    required this.text,
    required this.onPressed,
  });

  final Widget child;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.large,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 40.h, 24.w, 32.h),
            child: child,
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.primaryNormal,
                borderRadius: BorderRadius.only(
                  bottomLeft: AppRadius.large.bottomLeft,
                  bottomRight: AppRadius.large.bottomRight,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: Text("확인", style: AppTypeface.label16Semibold.copyWith(color: AppColor.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TicatsTwoButtonDialog extends ConsumerWidget {
  const _TicatsTwoButtonDialog(
    this.child, {
    required this.text,
    required this.onPressed,
  });

  final Widget child;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.large,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 40.h, 24.w, 32.h),
            child: child,
          ),
          Row(
            children: [
              Flexible(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => ref.read(routerProvider).pop(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppGrayscale.gray70,
                      borderRadius: BorderRadius.only(bottomLeft: AppRadius.large.bottomLeft),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        child: Text("닫기", style: AppTypeface.label16Semibold.copyWith(color: AppColor.white)),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: onPressed,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.primaryNormal,
                      borderRadius: BorderRadius.only(bottomRight: AppRadius.large.bottomRight),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        child: Text("확인", style: AppTypeface.label16Semibold.copyWith(color: AppColor.white)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

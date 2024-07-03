import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/gen/assets.gen.dart';
import 'package:ticats/presentation/index.dart';

class RegisterProfilePage extends BasePage {
  const RegisterProfilePage({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      primary: false,
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                const _AddProfileImageWidget(),
                SizedBox(height: 30.h),
                const NickInputView(),
                const Spacer(),
                TicatsCTAButton.contained(
                  size: ButtonSize.large,
                  text: "다음",
                  onPressed: () {
                    ref.read(routerProvider).pushNamed(RoutePath.registerAccount);
                  },
                ),
                SizedBox(height: 13.h),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) => TicatsAppBar.back("프로필 등록");

  @override
  bool get resizeToAvoidBottomInset => false;
}

class _AddProfileImageWidget extends ConsumerWidget {
  const _AddProfileImageWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Assets.images.profile.svg(width: 100.w, height: 100.w),
          Positioned.fill(
            right: -4.w,
            bottom: -4.w,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Assets.images.profileCamera.svg(width: 32.w, height: 32.w),
            ),
          ),
        ],
      ),
    );
  }
}

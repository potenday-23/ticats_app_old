import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticats/presentation/index.dart';

class RegisterAccountPage extends BasePage {
  const RegisterAccountPage({super.key});

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
                const AccountInputView(),
                const SelectGenderView(),
                const Spacer(),
                TicatsCTAButton.contained(
                  size: ButtonSize.large,
                  text: "다음",
                  onPressed: () {
                    showTicatsBottomSheet(context, const TermAgreeView());
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

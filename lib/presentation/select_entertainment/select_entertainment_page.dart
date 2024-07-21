import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/domain/entities/state/term_agree_state.dart';
import 'package:ticats/domain/index.dart';
import 'package:ticats/gen/assets.gen.dart';
import 'package:ticats/presentation/index.dart';

// ignore: must_be_immutable
class SelectEntertainmentPage extends BasePage {
  SelectEntertainmentPage({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    final double coverSize = (MediaQuery.of(context).size.width - 56.w) / 2;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 13.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            SizedBox(height: 36.h),
            _buildEntertainmentOptions(coverSize),
            SizedBox(height: 40.h),
            _buildStartButton(context, ref),
            SizedBox(height: 20.h),
            _buildSkipButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return RichText(
      text: TextSpan(
        children: const [
          TextSpan(text: "맞춤 문화생활을 추천을 위해 \n마음에 드는 문화생활을 "),
          TextSpan(text: "최대 3개", style: TextStyle(color: AppColor.primaryDark)),
          TextSpan(text: " 선택해주세요!"),
        ],
        style: AppTypeface.body18Bold,
      ),
    );
  }

  Widget _buildEntertainmentOptions(double coverSize) {
    return Wrap(
      spacing: 16.w,
      runSpacing: 16.w,
      children: List.generate(10, (index) => _buildEntertainmentOption(coverSize)),
    );
  }

  Widget _buildEntertainmentOption(double coverSize) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: coverSize,
              height: coverSize,
              decoration: BoxDecoration(color: AppGrayscale.gray70, borderRadius: AppRadius.small),
            ),
            Container(
              width: coverSize,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                "Ipsum Lorasdasfafsem",
                style: AppTypeface.label16Medium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Assets.images.entertainmentSelect.svg(width: coverSize, height: coverSize, fit: BoxFit.cover),
      ],
    );
  }

  Widget _buildStartButton(BuildContext context, WidgetRef ref) {
    return TicatsCTAButton.contained(
      text: "티캣츠 시작하기",
      onPressed: () async {
        MemberInfoEntity memberInfo = ref.read(signInProvider);
        memberInfo = memberInfo.copyWith(isMarketingAgree: ref.read(termAgreeProvider).checkMarketing);
        print(memberInfo);

        print(await ref.read(authUseCasesProvider).setUserInfo.execute(memberInfo));

        if (!context.mounted) return;
        showTicatsWelcomeDialog(context);
      },
    );
  }

  Widget _buildSkipButton(BuildContext context) {
    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          showTicatsBottomNotification();
        },
        child: Text("건너뛰기", style: AppTypeface.label14Medium),
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) {
    return const TicatsAppBar("문화생활 선택하기");
  }

  @override
  Color screenBackgroundColor = const Color(0xFFFDFBFC);
}

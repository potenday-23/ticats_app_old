import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/domain/entities/state/term_agree_state.dart';
import 'package:ticats/presentation/index.dart';

final termAgreeProvider = StateProvider<TermAgreeState>((ref) => const TermAgreeState());

class TermAgreeView extends ConsumerWidget {
  const TermAgreeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final termAgreeProv = ref.watch(termAgreeProvider);
    final termAgreeProvNotifier = ref.watch(termAgreeProvider.notifier);

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
                TicatsCheckbox(
                  value: termAgreeProv.isAllAgree(),
                  onChanged: (val) => termAgreeProvNotifier.state = termAgreeProv.checkAllAgree(),
                ),
                SizedBox(width: 10.w),
                Text("모두 동의합니다.", style: AppTypeface.label16Bold),
              ],
            ),
            SizedBox(height: 4.h),
            _TermAgreeCheckBox(
              TermEnum.termOfUse,
              isAgree: termAgreeProv.checkUsage,
              onChanged: (value) => termAgreeProvNotifier.state = termAgreeProv.copyWith(checkUsage: value),
            ),
            _TermAgreeCheckBox(
              TermEnum.privacyPolicy,
              isAgree: termAgreeProv.checkPrivacy,
              onChanged: (value) => termAgreeProvNotifier.state = termAgreeProv.copyWith(checkPrivacy: value),
            ),
            _TermAgreeCheckBox(
              TermEnum.locationPolicy,
              isAgree: termAgreeProv.checkLocation,
              onChanged: (value) => termAgreeProvNotifier.state = termAgreeProv.copyWith(checkLocation: value),
            ),
            _TermAgreeCheckBox(
              TermEnum.marketingPolicy,
              isAgree: termAgreeProv.checkMarketing,
              onChanged: (value) => termAgreeProvNotifier.state = termAgreeProv.copyWith(checkMarketing: value),
            ),
            SizedBox(height: 25.h),
            TicatsCTAButton.contained(
              isEnabled: termAgreeProv.isRequiredAgree(),
              text: "다음",
              onPressed: () async {
                if (!termAgreeProv.checkMarketing) {
                  await showTicatsTwoButtonAsyncDialog(
                    context,
                    barrierDismissible: false,
                    child: Text(
                      "마케팅 정보 수신 및 이용에 동의하면,\n문화생활 알림을 받을 수 있어요!",
                      style: AppTypeface.label16Regular,
                      textAlign: TextAlign.center,
                    ),
                    text: "알림 받기",
                    leftPressed: () {
                      ref.read(routerProvider).pop();
                      ref.read(routerProvider).push(RoutePath.permissionAgree);
                    },
                    onPressed: () async {
                      termAgreeProvNotifier.state = termAgreeProv.copyWith(checkMarketing: true);
                      ref.read(routerProvider).pop();

                      await showTicatsAsyncDialog(
                        barrierDismissible: false,
                        context,
                        child: Column(
                          children: [
                            Text("마케팅정보 앱 푸시 동의 안내", style: AppTypeface.label16Semibold),
                            Text(
                              "전송자: 티캣츠\n수신허용일시: ${DateFormat("yyyy년 MM월 dd일").format(DateTime.now())}\n처리내용: 수신허용 처리완료",
                              style: AppTypeface.label16Regular,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        onPressed: () {
                          ref.read(routerProvider).pop();
                          ref.read(routerProvider).push(RoutePath.permissionAgree);
                        },
                      );
                    },
                  );
                  return;
                }

                if (!context.mounted) return;
                if (termAgreeProv.checkMarketing) {
                  await showTicatsAsyncDialog(
                    context,
                    child: Column(
                      children: [
                        Text("마케팅정보 앱 푸시 동의 안내", style: AppTypeface.label16Semibold),
                        Text(
                          "전송자: 티캣츠\n수신허용일시: 2024년 6월 10일\n처리내용: 수신허용 처리완료",
                          style: AppTypeface.label16Regular,
                        ),
                      ],
                    ),
                    onPressed: () {
                      ref.read(routerProvider).pop();
                      ref.read(routerProvider).push(RoutePath.permissionAgree);
                    },
                  );
                }
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
  const _TermAgreeCheckBox(this.term, {required this.onChanged, required this.isAgree});

  final TermEnum term;

  final Function(bool)? onChanged;
  final bool isAgree;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        TicatsCheckbox(
          value: isAgree,
          onChanged: onChanged,
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

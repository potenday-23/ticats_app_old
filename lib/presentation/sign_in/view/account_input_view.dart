import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/domain/index.dart';
import 'package:ticats/presentation/index.dart';

final _emailController = TextEditingController();
final _birthController = TextEditingController();

class AccountInputView extends HookConsumerWidget {
  const AccountInputView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInProv = ref.watch(signInProvider);
    final signInProvNotifier = ref.watch(signInProvider.notifier);

    useEffect(() {
      _emailController.text = signInProv.email ?? "";

      return null;
    }, [signInProv.email, signInProv.birthday, signInProv.gender]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text("이메일", style: AppTypeface.label16Semibold),
        ),
        SizedBox(height: 10.h),
        TicatsUnderlineTextField(
          isEnable: signInProv.provider == LoginProvider.apple,
          hintText: "ticats1020@gmail.com 형식으로 작성해주세요.",
          controller: _emailController,
          onChanged: (value) {
            MemberInfoEntity newValue = signInProv.copyWith(email: value);
            signInProvNotifier.setMember(newValue);
          },
        ),
        SizedBox(height: 56.h),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text("생년월일", style: AppTypeface.label16Semibold),
        ),
        SizedBox(height: 10.h),
        TicatsUnderlineTextField(
          hintText: "생년월일 6자리를 입력해주세요.",
          keyboardType: TextInputType.number,
          controller: _birthController,
          maxLength: 6,
          onChanged: (value) {
            if (value.isValidBirth() && value.length == 6) {
              final century = (int.parse(value.substring(0, 2)) <= int.parse(DateFormat('yy').format(DateTime.now()))) ? 20 : 19;

              MemberInfoEntity newValue = signInProv.copyWith(
                birthday: DateTime(
                  int.parse("$century${value.substring(0, 2)}"),
                  int.parse(value.substring(2, 4)),
                  int.parse(value.substring(4, 6)),
                ),
              );
              signInProvNotifier.setMember(newValue);
            } else {
              signInProvNotifier.setMember(signInProv.copyWith(birthday: null));
            }
          },
        ),
        SizedBox(height: 56.h),
      ],
    );
  }
}

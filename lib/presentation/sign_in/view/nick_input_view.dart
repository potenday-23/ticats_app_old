import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/domain/index.dart';
import 'package:ticats/presentation/index.dart';

final nickStatusProvider = StateProvider<TextFieldStatus>((ref) => TextFieldStatus.normal);
final _nickStatusTextProvider = StateProvider<String>((ref) => '');
final nickTextProvider = StateProvider<TextEditingController>((ref) => TextEditingController());
final nickTextLengthProvider = StateProvider<int>((ref) => 0);

class NickInputView extends ConsumerWidget {
  const NickInputView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Debouncer debouncer = Debouncer();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text("닉네임", style: AppTypeface.label16Semibold.copyWith(color: AppColor.black)),
        ),
        SizedBox(height: 10.h),
        TicatsBorderTextField(
          hintText: "티케팅하는 고양이",
          status: ref.watch(nickStatusProvider),
          statusText: ref.watch(_nickStatusTextProvider),
          controller: ref.watch(nickTextProvider),
          currentLength: ref.watch(nickTextLengthProvider),
          maxLength: 10,
          onChanged: (value) async {
            ref.read(nickTextProvider.notifier).state.text = value;
            ref.read(nickTextLengthProvider.notifier).state = value.length;

            debouncer.debounce(
              duration: const Duration(microseconds: 100),
              onDebounce: () async {
                if (value.isNotEmpty && value.length > 10) {
                  ref.read(nickStatusProvider.notifier).state = TextFieldStatus.error;
                  ref.read(_nickStatusTextProvider.notifier).state = "10자 이하로 입력해주세요.";
                } else if (!value.isValidNick()) {
                  ref.read(nickStatusProvider.notifier).state = TextFieldStatus.error;
                  ref.read(_nickStatusTextProvider.notifier).state = "닉네임에는 영어, 한글만 사용이 가능해요.";
                } else if (!await ref.read(authUseCasesProvider).getNickValid.execute(value)) {
                  ref.read(nickStatusProvider.notifier).state = TextFieldStatus.error;
                  ref.read(_nickStatusTextProvider.notifier).state = "이미 사용하고 있는 닉네임이예요.";
                } else {
                  ref.read(nickStatusProvider.notifier).state = TextFieldStatus.normal;
                  ref.read(_nickStatusTextProvider.notifier).state = "";
                }
              },
            );
          },
        ),
      ],
    );
  }
}

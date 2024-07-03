import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/gen/assets.gen.dart';
import 'package:ticats/presentation/index.dart';

class TicatsSearchTextField extends ConsumerWidget {
  const TicatsSearchTextField({
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.isEnable = true,
    super.key,
  });

  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final bool isEnable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String searchText = ref.watch(searchTextControllerProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 5.w),
      child: TextField(
        enabled: isEnable,
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
          filled: true,
          fillColor: AppGrayscale.gray95,
          hintText: '티켓을 검색해보세요!',
          hintStyle: AppTypeface.label16Regular.copyWith(color: AppGrayscale.gray55),
          border: OutlineInputBorder(borderRadius: AppRadius.small, borderSide: BorderSide.none),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (searchText.isNotEmpty)
                  GestureDetector(
                    child: Assets.icons.clear.svg(width: 20.w, height: 20.w),
                    onTap: () => controller.clear(),
                  ),
                IconButton(
                  icon: Assets.icons.search.svg(width: 24.w, height: 24.w),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        inputFormatters: [LengthLimitingTextInputFormatter(30)],
        style: AppTypeface.label16Regular,
      ),
    );
  }
}

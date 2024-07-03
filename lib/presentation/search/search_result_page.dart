import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/presentation/index.dart';

class SearchResultPage extends BasePage {
  const SearchResultPage({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: ref.read(searchTextControllerProvider), style: AppTypeface.label12Bold),
                    const TextSpan(text: " 으로 검색한 결과에요. "),
                    TextSpan(text: "추천 검색어", style: AppTypeface.label12Bold.copyWith(color: AppColor.primaryDark)),
                    const TextSpan(text: " 검색 결과 보기"),
                  ],
                  style: AppTypeface.label12Regular,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 9.h),
              child: Wrap(
                spacing: 12.w,
                children: [
                  TicatsChip("카테고리", onTap: () {}, textStyle: AppTypeface.label14Bold),
                  TicatsChip.arrowDown("인기순", onTap: () {}),
                  TicatsChip.arrowDown("공연여부", onTap: () {}),
                ],
              ),
            ),
            if (ref.read(searchTextControllerProvider).isNotEmpty) ...[
              const SearchResultView(),
            ] else ...[
              const SearchResultEmptyView(),
            ]
          ],
        ),
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () => ref.read(routerProvider).pop(),
        child: TicatsSearchTextField(
          isEnable: false,
          controller: TextEditingController(text: ref.read(searchTextControllerProvider)),
        ),
      ),
      toolbarHeight: 56.w,
    );
  }
}

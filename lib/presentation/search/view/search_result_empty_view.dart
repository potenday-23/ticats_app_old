import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/gen/assets.gen.dart';
import 'package:ticats/presentation/index.dart';

class SearchResultEmptyView extends ConsumerWidget {
  const SearchResultEmptyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 68.h),
          Assets.images.catLick.svg(width: 94.w, height: 144.w),
          SizedBox(height: 24.h),
          Text("아쉽게도 일치하는 내용이 없어요.\n다른 검색어를 입력해보세요.", style: AppTypeface.label16Bold),
          SizedBox(height: 24.h),
          Text("* 공연이 종료되는 경우에는 검색되지 않아요", style: AppTypeface.label14Medium),
          SizedBox(height: 68.h),
          const _RecommendEvents(),
        ],
      ),
    );
  }
}

class _RecommendEvents extends ConsumerWidget {
  const _RecommendEvents();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            Text("이런 검색어는 어떨까요?", style: AppTypeface.body18Bold),
            SizedBox(height: 20.h),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12.w,
              runSpacing: 12.w,
              children: List.generate(5, (index) => TicatsChip("추천 검색어$index", onTap: () {})),
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}

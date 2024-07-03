import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/presentation/index.dart';

final searchTextControllerProvider = StateProvider<String>((ref) => "");

class SearchPage extends BasePage {
  SearchPage({super.key});

  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    _searchTextController.addListener(() {
      if (_searchTextController.text.isNotEmpty) {
        ref.read(searchTextControllerProvider.notifier).state = _searchTextController.text;
      } else {
        ref.read(searchTextControllerProvider.notifier).state = '';
      }
    });

    final String searchText = ref.watch(searchTextControllerProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          if (searchText.isEmpty) ...[
            const _SearchHistory(),
            const _RecommendSearch(),
          ] else ...[
            const _SearchResult(),
          ],
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: TicatsSearchTextField(
        controller: _searchTextController,
        onSubmitted: (_) => ref.read(routerProvider).pushNamed(RoutePath.searchResult),
      ),
      toolbarHeight: 56.w,
    );
  }
}

class _SearchHistory extends ConsumerWidget {
  const _SearchHistory();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("검색 기록", style: AppTypeface.label16Medium),
          SizedBox(height: 16.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 8.w,
              children: [
                for (int i = 0; i < 5; i++) ...[TicatsChip.close("검색어 $i", onTap: () {})],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RecommendSearch extends ConsumerWidget {
  const _RecommendSearch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 36.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("추천 인기 검색어", style: AppTypeface.label16Medium),
          SizedBox(height: 16.h),
          for (int i = 0; i < 10; i++) ...[_buildRecommendItem(i + 1, "추천 검색어 $i")],
        ],
      ),
    );
  }

  Widget _buildRecommendItem(int index, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Text(index.toString(), style: AppTypeface.body20Bold.copyWith(color: AppColor.primaryDark)),
          SizedBox(width: 12.w),
          Text(text, style: AppTypeface.label16Regular.copyWith(color: AppGrayscale.gray10)),
        ],
      ),
    );
  }
}

class _SearchResult extends ConsumerWidget {
  const _SearchResult();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: Column(
        children: [
          for (int i = 0; i < 4; i++) _buildSearchResultItem("검색 결과 $i"),
        ],
      ),
    );
  }

  Widget _buildSearchResultItem(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Text(text, style: AppTypeface.label16Medium),
        SizedBox(height: 8.h),
        Divider(height: 1.w, thickness: 1.w, color: AppGrayscale.gray85),
      ],
    );
  }
}

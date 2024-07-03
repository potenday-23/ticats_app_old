import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/presentation/index.dart';

class SearchResultView extends ConsumerWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 16.w,
      runSpacing: 16.w,
      children: const [
        TicatsEventWidget(),
        TicatsEventWidget(status: TicatsEventStatus.ticketReservation),
      ],
    );
  }
}

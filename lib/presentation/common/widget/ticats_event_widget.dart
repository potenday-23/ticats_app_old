import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/gen/assets.gen.dart';
import 'package:ticats/presentation/index.dart';

class TicatsEventWidget extends ConsumerWidget {
  const TicatsEventWidget({
    this.status = TicatsEventStatus.ticketOpen,
    super.key,
  });

  final TicatsEventStatus status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 167.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(borderRadius: AppRadius.xxsmall, child: Assets.images.evan.image(height: 221.w)),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text("뮤지컬 <디어 에반 핸슨>(Dear Evan Hansen)", style: AppTypeface.label14Bold)),
              SizedBox(width: 2.w),
              Assets.icons.heartFill.svg(width: 24.w, height: 24.w),
            ],
          ),
          SizedBox(height: 4.h),
          if (status == TicatsEventStatus.ticketReservation) ...[
            FittedBox(
              child: Row(
                children: [
                  const TicatsEventStatusChip(),
                  SizedBox(width: 4.w),
                  Text("2024.03.28.화 15:00", style: AppTypeface.label12Bold.copyWith(color: AppColor.systemError)),
                ],
              ),
            ),
            SizedBox(height: 4.h),
          ],
          Text("충무아트센서 대극장", style: AppTypeface.label12Regular),
          if (status == TicatsEventStatus.ticketOpen) ...[
            Text("2021.10.01 ~ 2022.01.02", style: AppTypeface.label12SemiBold),
          ],
        ],
      ),
    );
  }
}

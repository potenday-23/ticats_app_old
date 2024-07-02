import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';

class TicatsCheckbox extends ConsumerWidget {
  TicatsCheckbox({
    this.value = false,
    this.onChanged,
    super.key,
  });

  final bool value;
  final Function(bool)? onChanged;

  final int id = UniqueKey().hashCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Checkbox(
      value: value,
      activeColor: AppColor.positiveBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.r)),
      onChanged: onChanged == null ? null : (value) => onChanged!(value!),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}

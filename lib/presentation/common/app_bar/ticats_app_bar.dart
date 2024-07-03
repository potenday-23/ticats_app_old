import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/index.dart';

class TicatsAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const TicatsAppBar(this.title, {super.key, this.hasBack = false});

  factory TicatsAppBar.back(title) => TicatsAppBar(title, hasBack: true);

  final String title;
  final bool hasBack;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(title, style: AppTypeface.label16Semibold),
      leading: hasBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () => ref.read(routerProvider).pop(),
            )
          : null,
      leadingWidth: hasBack ? 60.w : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(54.h);
}

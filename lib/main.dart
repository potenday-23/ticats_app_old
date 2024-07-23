import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'package:ticats/app/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  KakaoSdk.init(nativeAppKey: "e431334bbd653b087fa3bdc1d431c42e");

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    ref.watch(authServiceProvider);

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: router,
          theme: AppTheme.defaultTheme,
          builder: EasyLoading.init(
            builder: (context, child) => Toast(navigatorKey: rootNavigatorKey, child: child!),
          ),
        );
      },
    );
  }
}

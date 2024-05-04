import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'widgetbook.directories.g.dart';

void main() => runApp(const WidgetbookApp());

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        DeviceFrameAddon(
          initialDevice: Devices.ios.iPhone13ProMax,
          devices: [
            Devices.ios.iPhone13ProMax,
            Devices.ios.iPhone13,
            Devices.ios.iPhone13Mini,
            Devices.android.samsungGalaxyS20,
            Devices.android.samsungGalaxyA50,
          ],
        ),
        BuilderAddon(
          name: 'ScreenUtil',
          builder: (context, child) {
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              useInheritedMediaQuery: true,
              builder: (context, child) => child!,
              child: child,
            );
          },
        ),
        AlignmentAddon(),
        ZoomAddon(),
      ],
      directories: directories,
      appBuilder: (context, child) {
        return child;
      },
    );
  }
}

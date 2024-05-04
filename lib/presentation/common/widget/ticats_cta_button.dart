import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticats/app/config/app_color.dart';
import 'package:ticats/app/config/app_grayscale.dart';
import 'package:ticats/app/config/app_radius.dart';
import 'package:ticats/app/config/app_typeface.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

enum ButtonType { primary, secondary }

enum ButtonSize { small, medium }

class TicatsCTAButton extends StatelessWidget {
  const TicatsCTAButton({
    super.key,
    this.border,
    required this.size,
    required this.isEnabled,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
  });

  final ButtonSize size;
  final bool isEnabled;
  final String text;
  final Color color;
  final Color textColor;
  final BoxBorder? border;
  final VoidCallback onPressed;

  factory TicatsCTAButton.contained({
    bool isEnabled = true,
    ButtonSize size = ButtonSize.medium,
    ButtonType type = ButtonType.primary,
    required String text,
    required VoidCallback onPressed,
  }) {
    final Color color;
    final Color textColor;

    if (type == ButtonType.primary) {
      color = isEnabled ? AppColor.primaryLight : AppGrayscale.gray70;
      textColor = AppColor.white;
    } else {
      color = isEnabled ? AppGrayscale.gray95 : AppGrayscale.gray85;
      textColor = isEnabled ? AppColor.black : AppGrayscale.gray60;
    }

    return TicatsCTAButton(
      isEnabled: isEnabled,
      size: size,
      text: text,
      color: color,
      textColor: textColor,
      onPressed: onPressed,
    );
  }

  factory TicatsCTAButton.outlined({
    bool isEnabled = true,
    ButtonSize size = ButtonSize.medium,
    required String text,
    required VoidCallback onPressed,
  }) {
    return TicatsCTAButton(
      isEnabled: isEnabled,
      size: size,
      text: text,
      border: Border.all(width: 1.w, color: isEnabled ? AppColor.primaryLight : AppGrayscale.gray70),
      color: isEnabled ? AppGrayscale.gray99 : AppGrayscale.gray90,
      textColor: isEnabled ? AppColor.black : AppGrayscale.gray60,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onPressed : null,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: size == ButtonSize.medium
            ? EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.w)
            : EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.w),
        decoration: BoxDecoration(
          border: border,
          borderRadius: AppRadius.small,
          color: color,
        ),
        child: Text(text,
            style: size == ButtonSize.medium
                ? AppTypeface().label16Semibold.copyWith(color: textColor)
                : AppTypeface().label14Medium.copyWith(color: textColor)),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: "Contained",
  type: TicatsCTAButton,
  path: "[Ticats]/Button",
)
TicatsCTAButton containedButton(BuildContext context) {
  return TicatsCTAButton.contained(
    size: context.knobs.list<ButtonSize>(label: "Size", options: ButtonSize.values, initialOption: ButtonSize.medium),
    type: context.knobs.list<ButtonType>(label: "Type", options: ButtonType.values, initialOption: ButtonType.primary),
    isEnabled: context.knobs.boolean(label: "Enabled", initialValue: true),
    text: "다음",
    onPressed: () {},
  );
}

@widgetbook.UseCase(
  name: "Outlined",
  type: TicatsCTAButton,
  path: "[Ticats]/Button",
)
TicatsCTAButton outlinedButton(BuildContext context) {
  return TicatsCTAButton.outlined(
    size: context.knobs.list<ButtonSize>(label: "Size", options: ButtonSize.values, initialOption: ButtonSize.medium),
    isEnabled: context.knobs.boolean(label: "Enabled", initialValue: true),
    text: "다음",
    onPressed: () {},
  );
}

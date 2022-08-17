import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimen.dart';
import 'app_text_theme.dart';

class InputDecorationThemes {
  static InputDecoration formInputDecoration = InputDecoration(
    labelStyle: AppTextTheme.inputTextStyle3,
      enabledBorder: const OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(AppDimen.inputDecorationRadius)),
        borderSide: BorderSide(color: AppColors.enableBorderColor, width: AppDimen.inputDecorationRadiusWidth),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimen.inputDecorationRadius),
        borderSide: const BorderSide(color: AppColors.focusedBorderColor, width: AppDimen.inputDecorationRadiusWidth),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimen.inputDecorationRadius),
        borderSide: const BorderSide(color: AppColors.errorBorderColor, width: AppDimen.inputDecorationRadiusWidth),
      ));
}

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimen.dart';

class AppBorderDecorationTheme{

  static appBorderDecoration({Color borderColor = AppColors.menuColor,double radius = 12.00}){
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor, width: AppDimen.boxDecorationRadiusWidth),
    );
  }

}

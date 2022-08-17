import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppLoginBorderDecoration{

  static appLoginBorderDecoration({Color borderColor = AppColors.menuColor,double radius = 40.00}){
    return BoxDecoration(
        borderRadius: BorderRadius.only(
        topRight: Radius.circular(radius),
    topLeft: Radius.circular(radius),
    bottomRight: Radius.circular(radius),
    bottomLeft: Radius.circular(radius)),
      color: borderColor
    );

  }

}

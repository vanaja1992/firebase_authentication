
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../theme/app_text_theme.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Function onTap;
  const AppButton(
      {Key? key,
      required this.title,
      this.buttonColor = AppColors.primaryColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: ()=>onTap(), child: Text(title,
    style: AppTextTheme.buttonTextStyle,)
    );

  }
}

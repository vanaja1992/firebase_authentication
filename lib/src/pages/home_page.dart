import 'package:flutter/material.dart';

import '../core/constants/app_strings.dart';
import '../core/theme/app_text_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            AppStrings.homeTitle,
            style: AppTextTheme.inputTextStyle1,
          ),
        ),
      ),
    );
  }
}

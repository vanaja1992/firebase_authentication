import 'package:flutter/material.dart';

import '../core/common_widgets/app_button.dart';
import '../core/constants/app_strings.dart';
import '../core/theme/app_text_theme.dart';
import '../features/todo/ui/pages/todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.homeTitle,
                style: AppTextTheme.inputTextStyle1,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AppButton(
                title: 'Enter TODO Note',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TodoPage()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

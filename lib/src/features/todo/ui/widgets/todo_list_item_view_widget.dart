import 'package:firebase_authentication/src/core/constants/app_strings.dart';
import 'package:firebase_authentication/src/features/todo/model/todo_model.dart';
import'package:flutter/material.dart';

import '../../../../core/common_widgets/app_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
class TodoListItemViewPage extends StatelessWidget {
  final TodoModel todoModelList;
  const TodoListItemViewPage({Key? key, required this.todoModelList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Card(
          color: AppColors.backgroundColor,
          borderOnForeground: true,
          child:Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      todoModelList.title,
                      style: AppTextTheme.inputTextStyle3.copyWith(fontWeight: FontWeight.bold,fontSize: 17),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      todoModelList.description,
                      style: AppTextTheme.inputTextStyle3.copyWith(fontWeight: FontWeight.bold,fontSize: 15),
                    ),
                  ),
                  Row(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width:40, height: 25),
                        child: AppButton(
                            title: AppStrings.todomenu,
                            onTap: () {
                             openEditAlertBox();
                              //cartItemModelData.decreaseQuantity();
                            }),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        AppStrings.todoCreateDate ,
                        style: AppTextTheme.inputTextStyle3.copyWith(fontSize: 13),
                      ),

                      Text(
                        todoModelList.createdDate.toString(),
                        style: AppTextTheme.inputTextStyle3.copyWith(color: AppColors.errorBorderColor,fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        AppStrings.todoRemindDate ,
                        style: AppTextTheme.inputTextStyle3.copyWith(fontSize: 13),
                      ),
                      Text(
                        todoModelList.endDate.toString(),
                        style: AppTextTheme.inputTextStyle3,
                      ),
                    ],
                  ),

                ],
              ),
        ),
            ],
          );

  }

  void openEditAlertBox() {

  }
}

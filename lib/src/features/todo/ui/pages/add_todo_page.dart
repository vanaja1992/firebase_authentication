import 'package:firebase_authentication/src/features/todo/cubit/todo_cubit.dart';
import 'package:firebase_authentication/src/features/todo/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/assets/app_assets.dart';
import '../../../../core/common_widgets/app_button.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helpers/form_validation_helper.dart';
import '../../../../core/helpers/popup_message_toast.dart';
import '../../../../core/theme/app_login_border_decoration.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/theme/input_decoration_theme.dart';
import 'todo_listview_page.dart';
class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final GlobalKey<FormState>  _formKey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController createdController = TextEditingController();
  TextEditingController remindDateController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(AppAssets.loginBg,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 15),
                child: Center(
                  child: Container(
                    decoration:
                    AppLoginBorderDecoration.appLoginBorderDecoration(),
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          AppStrings.todonote,
                          style: AppTextTheme.inputTextStyle1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: titleController,
                                  decoration: InputDecorationThemes
                                      .formInputDecoration
                                      .copyWith(labelText: AppStrings.usercname),
                                  validator: (val) {
                                    return FormValidationHelper.validateTodoTitle(
                                        val);
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: createdController,
                                  decoration: InputDecorationThemes
                                      .formInputDecoration
                                      .copyWith(labelText: AppStrings.todoCreateDate),
                                  validator: (val) {
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: remindDateController,
                                  decoration: InputDecorationThemes
                                      .formInputDecoration
                                      .copyWith(labelText: AppStrings.todoRemindDate),
                                  validator: (val) {
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: descController,
                                  decoration: InputDecorationThemes
                                      .formInputDecoration
                                      .copyWith(labelText: AppStrings.todoIncorrectDescErrorMessage,),
                                  validator: (val) {
                                    return FormValidationHelper.validateTodoDescription(
                                        val);
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: statusController,
                                  decoration: InputDecorationThemes
                                      .formInputDecoration
                                      .copyWith(labelText: AppStrings.statusPassword,),
                                  validator: (val) {
                                    return null;
                                                                    },
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        BlocConsumer<TodoCubit, TodoState>(
                          listener: (_, state) {
                            if(state is TodoCreateInitial || state is TodoCreateLoading){
                              EasyLoading.show(status: AppStrings.loading);
                            }
                            else if (state is TodoCreateLoadError) {
                              EasyLoading.dismiss();
                              clearField();
                              PopupMessageToast.showMessageToast(state.todoCreateErrorMessage);
                            }
                            else if (state is TodoCreateSuccess) {
                              //EasyLoading.dismiss();
                              clearField();
                              PopupMessageToast.showMessageToast(AppStrings.successAddTodo);
                              navigatePage();
                            }
                            else{

                            }
                          },
                          builder: (_, state) {
                            return AppButton(
                                  title: AppStrings.todoButton,
                                  onTap: () {
                                    if (!(_formKey.currentState?.validate() ??
                                        false)) {
                                      return;
                                    }
                                    TodoModel todoModel = TodoModel(
                                        title: titleController.text,
                                        createdDate: DateTime.now(),
                                        endDate: DateTime.now(),
                                        description: descController.text,
                                        todoStatus:TodoStatus.todo
                                    );
                                      context.read<TodoCubit>().addTodoList(todoModel);

                                  });


                          },
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void clearField() {
    titleController.clear();
    createdController.clear();
    remindDateController.clear();
    descController.clear();
    statusController.clear();
  }

  void navigatePage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const TodoListViewPage()));
  }
}

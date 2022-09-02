import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_authentication/src/core/helpers/popup_message_toast.dart';
import 'package:firebase_authentication/src/features/todo/cubit/todo_cubit.dart';
import 'package:firebase_authentication/src/features/todo/cubit/todo_repository.dart';
import 'package:firebase_authentication/src/features/todo/ui/widgets/todo_list_item_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/common_widgets/app_button.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../model/todo_model.dart';
import 'add_todo_page.dart';

class TodoListViewPage extends StatefulWidget {
  const TodoListViewPage({Key? key}) : super(key: key);

  @override
  State<TodoListViewPage> createState() => _TodoListViewPageState();
}

class _TodoListViewPageState extends State<TodoListViewPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(TodoRepository())..getTodoList(),
      child: Scaffold(
        floatingActionButton: Container(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 50,
            ),
            onPressed: () {
              NavigatetoAddTodo();
            },
          ),
        ),
        body: SafeArea(
          child: BlocConsumer<TodoCubit, TodoState>(
            listener: (_, state) {
              if (state is TodoCreateInitial || state is TodoLoading) {
                EasyLoading.show(status: AppStrings.loading);
              } else if (state is TodoLoadError) {
                EasyLoading.dismiss();
                PopupMessageToast.showMessageToast(state.LoadError);
              }
              else {

              }
            },
            builder: (_, state) {
              if (state is TodoLoadError) {
                EasyLoading.dismiss();
                PopupMessageToast.showMessageToast(state.LoadError);
                return Text(AppStrings.todoErrorMessage);
              }
              else if (state is TodoLoaded) {
                return ListView.builder(
                    itemCount: state.querySnapshot.docs.length,
                    itemBuilder: (context, pos) {
                     QueryDocumentSnapshot snapshot = state.querySnapshot.docs[pos];
                     TodoModel todoModel = TodoModel.fromJson(snapshot.data());
                     todoModel.todoId = snapshot.id;

                      return TodoListItemViewPage(todoModelList:todoModel);
                    });
              } else {
                return Container();
              }
            },

          ),

        ),

      ),
    );
  }

  void NavigatetoAddTodo() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AddTodoPage()));
  }
}

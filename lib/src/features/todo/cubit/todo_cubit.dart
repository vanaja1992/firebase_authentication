import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_authentication/src/core/constants/app_strings.dart';
import 'package:firebase_authentication/src/features/todo/cubit/todo_repository.dart';
import 'package:firebase_authentication/src/features/todo/model/todo_model.dart';
part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoRepository todoRepository;
  TodoCubit(this.todoRepository) : super(TodoCreateInitial());
  //final List<TodoModel> todoListModel = [];

  addTodoList(TodoModel todoModel) async {
    emit(TodoCreateLoading());
    try {
      // todoListModel.add(todoModel);
      bool todoResult = await TodoRepository().addTodoList(todoModel);
      if (todoResult) {
        //Todo


      } else {
        emit(const TodoCreateLoadError(AppStrings.errorAddTodo));
      }
    } catch (ex) {
      return null;
    }
  }

  updateTodo(TodoModel todoModel, String docId) async {
    bool todoUpdate = await TodoRepository().updateTodo(todoModel, docId);
    if (todoUpdate) {
      emit(const TodoUpdateSuccess(AppStrings.successAddTodo));
    } else {
      emit(const TodoUpdateFailure(AppStrings.errorUpdateTodo));
    }
    await Future.delayed(const Duration(seconds: 2));
  }

  getTodoList() async {
    emit(TodoCreateLoading());
    QuerySnapshot? snapshot = await TodoRepository().getTodoList();
    if (snapshot != null) {
      emit(TodoLoaded(snapshot));
    } else {
      emit(TodoLoadError(AppStrings.errorLoading));
    }
  }
}

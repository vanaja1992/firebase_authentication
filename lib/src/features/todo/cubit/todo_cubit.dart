import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_authentication/src/features/todo/cubit/todo_repository.dart';
import 'package:firebase_authentication/src/features/todo/model/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoRepository todoRepository;
  TodoCubit(this. todoRepository) : super(TodoInitial());
  final List<TodoModel> todoListModel = [];
  

  addTodoList(TodoModel todoModel) async {
    emit(TodoLoading());
    try{
      todoListModel.add(todoModel);
      TodoModel todoModelList =  await TodoRepository().addTodoList(todoModel);
      if(todoModelList == null){

      }
    }
    catch(ex){

    }


  }
}

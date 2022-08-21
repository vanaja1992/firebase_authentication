part of 'todo_cubit.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoading extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoaded extends TodoState {
 final  List<TodoModel> todoList;

 const TodoLoaded(this.todoList);

  @override
  List<Object> get props => [todoList];
}

class TodoLoadError extends TodoState {
  final String todoErrorMessage;

  const TodoLoadError(this.todoErrorMessage);

  @override
  List<Object> get props => [todoErrorMessage];
}

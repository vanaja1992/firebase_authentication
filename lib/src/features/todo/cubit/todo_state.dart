part of 'todo_cubit.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoCreateInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoCreateLoading extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoCreateSuccess extends TodoState {
  final List<TodoModel> todoList;

  const TodoCreateSuccess(this.todoList);

  @override
  List<Object> get props => [todoList];
}

class TodoCreateLoadError extends TodoState {
  final String todoCreateErrorMessage;

  const TodoCreateLoadError(this.todoCreateErrorMessage);

  @override
  List<Object> get props => [todoCreateErrorMessage];
}

class TodoUpdateSuccess extends TodoState {
  final String todoUpdateSuccessMessage;

  const TodoUpdateSuccess(this.todoUpdateSuccessMessage);

  @override
  List<Object> get props => [todoUpdateSuccessMessage];
}

class TodoUpdateFailure extends TodoState {
  final String todoUpdateFailureMessage;

  const TodoUpdateFailure(this.todoUpdateFailureMessage);

  @override
  List<Object> get props => [todoUpdateFailureMessage];

}

class TodoLoaded extends TodoState {
  QuerySnapshot querySnapshot;

  TodoLoaded(this.querySnapshot);

  @override
  List<Object> get props => [querySnapshot];
}

class TodoLoading extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoadError extends TodoState {
  String LoadError;

  TodoLoadError(this.LoadError);

  @override
  List<Object> get props => [LoadError];
}



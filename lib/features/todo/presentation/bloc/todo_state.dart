part of "todo_bloc.dart";

abstract class TodoState extends Equatable {}

class TodoInitialState extends TodoState {
  @override
  List<Object?> get props => [];
}

class TodoLoadingState extends TodoState {
  @override
  List<Object?> get props => [];
}

class TodoLoadedState extends TodoState {
  final Todo todo;
  TodoLoadedState(this.todo);

  @override
  List<Object?> get props => [todo];
}

class TodoListLoadedState extends TodoState {
  final List<Todo> todos;
  TodoListLoadedState(this.todos);

  @override
  List<Object?> get props => [...todos];
}

class TodoErrorState extends TodoState {
  final String message;
  TodoErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

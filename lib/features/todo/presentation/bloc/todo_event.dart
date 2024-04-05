part of "todo_bloc.dart";

@immutable
abstract class TodoEvent extends Equatable {}

class GetTodoEvent extends TodoEvent {
  final int id;
  GetTodoEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetAllTodosEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

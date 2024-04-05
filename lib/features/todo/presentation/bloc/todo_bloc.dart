import 'package:arch_demo/core/usecases/usecase.dart';
import 'package:arch_demo/features/todo/domain/entities/todo.dart';
import 'package:arch_demo/features/todo/domain/usecases/get_all_todos.dart';
import 'package:arch_demo/features/todo/domain/usecases/get_todo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_state.dart';
part "todo_event.dart";

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  GetAllTodos getAllTodos;
  GetTodo getTodo;
  TodoBloc({required this.getAllTodos, required this.getTodo})
      : super(TodoInitialState()) {
    on<GetTodoEvent>((event, emit) async {
      emit(TodoLoadingState());
      final failureOrTodo = await getTodo(Params(id: event.id));

      failureOrTodo.fold((failure) {
        
        return emit(TodoErrorState(failure.message));
      }, (todo) {
    
        return emit(TodoLoadedState(todo));
      });
    });

    on<GetAllTodosEvent>((event, emit) async {
      emit(TodoLoadingState());
      final failureOrTodoList = await getAllTodos(NoParams());
      failureOrTodoList.fold((failure) => emit(TodoErrorState(failure.message)),
          (todo) => emit(TodoListLoadedState(todo)));
    });
  }
}

import 'package:arch_demo/core/error/failures.dart';
import 'package:arch_demo/core/usecases/usecase.dart';
import 'package:arch_demo/features/todo/domain/entities/todo.dart';
import 'package:arch_demo/features/todo/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetTodo implements UseCase<Todo, Params> {
  final TodoRepository repository;
  GetTodo(this.repository);

  @override
  Future<Either<Failure, Todo>> call(Params params) async {
    return await repository.getTodo(params.id);
  }
}

class Params extends Equatable {
 final int id;
 const Params({required this.id});

  @override
  List<Object> get props => [id];
}
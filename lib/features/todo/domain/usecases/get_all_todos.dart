import 'package:arch_demo/core/error/failures.dart';
import 'package:arch_demo/core/usecases/usecase.dart';
import 'package:arch_demo/features/todo/domain/entities/todo.dart';
import 'package:arch_demo/features/todo/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllTodos implements UseCase< List<Todo>, NoParams> {
  final TodoRepository repository;
  GetAllTodos(this.repository);

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) async {
    return await repository.getAllTodos();
  }
  
}
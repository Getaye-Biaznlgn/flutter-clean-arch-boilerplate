import 'package:arch_demo/core/network/network_info.dart';
import 'package:arch_demo/features/todo/data/datasources/todo_data_source.dart';
import 'package:arch_demo/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:arch_demo/features/todo/domain/repositories/todo_repository.dart';
import 'package:arch_demo/features/todo/domain/usecases/get_all_todos.dart';
import 'package:arch_demo/features/todo/domain/usecases/get_todo.dart';
import 'package:arch_demo/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerLazySingleton(
    () => TodoBloc(
       getTodo: sl(),
       getAllTodos: sl()
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetTodo(sl()));
  sl.registerLazySingleton(() => GetAllTodos(sl()));

  // Repository
  sl.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(
    todoDataSource: sl()
    ),
  );

  // Data sources
  sl.registerLazySingleton<TodoDataSource>(
    () => TodoDataSourceImpl(),
  );



  //! Core
   sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

}
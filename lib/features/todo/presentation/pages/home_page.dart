import 'package:arch_demo/core/constants/app_strings.dart';
import 'package:arch_demo/dependency_injection.dart';
import 'package:arch_demo/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:arch_demo/features/todo/presentation/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    sl<TodoBloc>().add(GetTodoEvent(1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: const Text(boilerplate)),
      body: Center(
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is TodoLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is TodoLoadedState) {
              return TodoItem(todo: state.todo);
            } else if (state is TodoListLoadedState) {
              return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    return TodoItem(
                      todo: state.todos[index],
                    );
                  });
            } else if (state is TodoErrorState) {
              return Text(state.message);
            }
            return TextButton(
                onPressed: () {
                  sl<TodoBloc>().add(GetTodoEvent(1));
                },
                child: const Text("Reload"));
          },
        ),
      ),
    );
  }
}

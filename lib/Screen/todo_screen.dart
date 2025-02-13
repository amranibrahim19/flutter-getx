import 'package:flutter/material.dart';
import 'package:flutter_todo/Controller/todo_controller.dart';
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: todoController.todoList.length,
          itemBuilder: (context, index) {
            final todo = todoController.todoList[index];

            return ListTile(
                title: Text(todoController.todoList[index].title),
                trailing: Obx(() => Checkbox(
                      value: todo.completed.value,
                      onChanged: (value) {
                        todo.completed.value = value ?? false;
                      },
                    )));
          },
        );
      }),
    );
  }
}

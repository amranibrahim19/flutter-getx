import 'package:flutter/cupertino.dart';
import 'package:flutter_todo/Model/todo_model.dart';
import 'package:flutter_todo/Services/todo_services.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  var todoList = <TodoModel>[].obs;
  var errorMessage = ''.obs;
  var isLoading = true.obs;

  final TodoServices todoService;

  TodoController({required this.todoService});

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  void fetchTodos() async {
    try {
      isLoading(true);
      errorMessage('');
      final todos = await todoService.fetchTodos();
      todoList.assignAll(todos);
    } catch (error) {
      errorMessage('Failed to load todos');
      print("Error: $error");
    } finally {
      isLoading(false);
    }
  }

  Future<void> addTodo({
    required String title,
    required String content,
  }) async {
    try {
      isLoading(true);
      errorMessage('');
      await todoService.addTodo(title: title, content: content);
      fetchTodos(); // Fetch new todos after adding
    } catch (error) {
      errorMessage('Failed to add todo');
      print("Error: $error");
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateTodoStatus({
    required BuildContext context,
    required String id,
    required bool isDone,
  }) async {
    try {
      errorMessage('');

      await todoService.updateTodoStatus(
        context: context,
        id: id,
        isDone: isDone,
      );

      int index = todoList.indexWhere((t) => t.id == id);
      if (index != -1) {
        todoList[index].status.value = isDone;
      }
    } catch (error) {
      errorMessage('Failed to update todo status');
      print("Error: $error");
    }
  }
}

import 'package:flutter_todo/Model/todo_model.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  var todoList = <Todo>[].obs;

  @override
  void onInit() {
    todoList.addAll(
      [
        Todo(
          title: 'Learn Flutter',
          completed: true,
        ),
        Todo(
          title: 'Learn GetX',
          completed: false,
        ),
        Todo(
          title: 'Build Apps',
          completed: false,
        ),
      ],
    );
    super.onInit();
  }
}
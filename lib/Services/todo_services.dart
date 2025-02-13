import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_todo/Model/todo_model.dart';
import 'package:flutter_todo/Services/api_services.dart';
import 'package:flutter_todo/Widget/success_toast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TodoServices extends GetxService {
  Future<List<TodoModel>> fetchTodos() async {
    final response = await http.get(Uri.parse("${ApiServices.url}/tasks"));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> tasks = data['tasks'];

      return tasks.map((taskJson) => TodoModel.fromJson(taskJson)).toList();
    } else {
      throw Exception("Failed to load todos");
    }
  }

  // Add new todo
  Future<void> addTodo({
    required String title,
    required String content,
  }) async {
    final response = await http.post(
      Uri.parse("${ApiServices.url}/tasks"),
      body: json.encode({
        "title": title,
        "content": content,
      }),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to add todo");
    }
  }

  // Update todo status
  Future<void> updateTodoStatus({
    required BuildContext context,
    required String id,
    required bool isDone,
  }) async {
    final response = await http.post(
      Uri.parse("${ApiServices.url}/tasks/$id"),
      body: json.encode({
        "isDone": isDone,
      }),
      headers: {
        "Content-Type": "application/json",
      },
    );

    print("Response: ${response.body}");

    SuccessToast.show(context, "Success", "Todo status updated successfully");

    if (response.statusCode != 200) {
      throw Exception("Failed to update todo status");
    }
  }
}

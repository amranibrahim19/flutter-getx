import 'package:get/get.dart';

class TodoModel {
  int? id;
  String title;
  String content;
  RxBool status = false.obs;

  TodoModel({
    this.id,
    required this.title,
    required this.content,
    required bool status,
  }) : status = RxBool(status);

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      status: json['status'] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'status': status.value ? 1 : 0,
    };
  }
}

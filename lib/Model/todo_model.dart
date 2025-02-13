import 'package:get/get.dart';

class Todo {
  String title;
  RxBool completed;

  Todo({required this.title, bool completed = false})
      : completed = completed.obs;
}

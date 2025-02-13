import 'package:flutter/material.dart';
import 'package:flutter_todo/Controller/todo_controller.dart';
import 'package:flutter_todo/Widget/success_toast.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Todo List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft01,
            color: Colors.white,
            size: 24.0,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ShadButton(
                  child: const Text('Add Task'),
                  onPressed: () {
                    // Initialize controllers
                    final titleController = TextEditingController();
                    final contentController = TextEditingController();

                    showShadDialog(
                      context: context,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ShadDialog(
                          title: const Text('Add Task'),
                          actions: [
                            SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: ShadButton(
                                child: const Text('Save changes'),
                                onPressed: () async {
                                  if (titleController.text.isEmpty ||
                                      contentController.text.isEmpty) {
                                    return;
                                  }

                                  todoController.addTodo(
                                    title: titleController.text,
                                    content: contentController.text,
                                  );

                                  Navigator.of(context).pop();
                                },
                              ),
                            )
                          ],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ShadInputFormField(
                                controller:
                                    titleController, // Attach controller
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 16.0,
                                ),
                                id: 'title',
                                label: const Text('Title'),
                                placeholder:
                                    const Text('Enter the title of the task'),
                                validator: (v) {
                                  if (v.length < 2 || v.isEmpty) {
                                    return 'Title must be at least 2 characters long or not empty';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 8.0),
                              ShadInputFormField(
                                controller:
                                    contentController, // Attach controller
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 16.0,
                                ),
                                id: 'content',
                                label: const Text('Content'),
                                placeholder:
                                    const Text('Enter the content of the task'),
                                validator: (v) {
                                  if (v.length < 2 || v.isEmpty) {
                                    return 'Content must be at least 2 characters long or not empty';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Display Todo List
            Obx(() {
              if (todoController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (todoController.todoList.isEmpty) {
                return const Center(child: Text("No tasks available"));
              }

              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  itemCount: todoController.todoList.length,
                  itemBuilder: (context, index) {
                    final todo = todoController.todoList[index];

                    return Obx(
                      () => ListTile(
                        title: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    todo.title,
                                    style: TextStyle(
                                      decoration: todo.status.value
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                    ),
                                  ),
                                  Text(
                                    todo.content,
                                    style: TextStyle(
                                      decoration: todo.status.value
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ShadCheckbox(
                              value: todo.status.value,
                              onChanged: (value) async {
                                todo.status.value = value;
                                await todoController.updateTodoStatus(
                                  context: context,
                                  id: todo.id.toString(),
                                  isDone: value,
                                );
                              },
                            ),
                            IconButton(
                              icon: HugeIcon(
                                icon: HugeIcons.strokeRoundedDelete02,
                                color: Colors.red,
                                size: 24.0,
                              ),
                              onPressed: () {
                                SuccessToast.show(
                                  context,
                                  'Task Deleted',
                                  'Task has been deleted successfully',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

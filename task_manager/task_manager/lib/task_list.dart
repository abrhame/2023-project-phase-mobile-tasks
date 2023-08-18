import 'package:flutter/material.dart';
import 'package:task_manager/models/dummy_data.dart'; // Adjust the path
import 'package:task_manager/models/task.dart'; // Adjust the path

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  TaskList(this.tasks, {Key? key}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: const Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 255, 73, 73),
        ),
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: const Text(
            "Todo List",
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            "./assets/todo.jpg",
            width: double.infinity,
            height: 200,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.tasks.length,
            itemBuilder: (context, index) {
              final task = widget.tasks[index];
              return ListTile(
                title: Row(
                  children: [
                    Text(task.title!),
                    const SizedBox(
                        width: 80), // Add spacing between title and subtitle
                    Text(task.dueDate!.substring(0, 10)),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

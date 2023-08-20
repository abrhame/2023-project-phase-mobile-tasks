import 'package:flutter/material.dart';
import 'package:task_manager/create_new_task.dart';
import 'package:task_manager/models/dummy_data.dart'; // Adjust the path
import 'package:task_manager/models/task.dart';
import 'package:task_manager/start_screen.dart';
import 'package:task_manager/task_detail.dart'; // Adjust the path

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
        leading: TextButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: ((context) => StartScreen())));
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 73, 73),
          ),
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
                title: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TaskDetails(task: task)));
                  },
                  child: Row(children: [
                    Text(task.title!),
                    const SizedBox(
                        width: 80), // Add spacing between title and subtitle
                    Text(task.dueDate!.substring(0, 10)),
                  ]),
                ),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 73, 73),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CreateTask()));
                },
                child: Text(
                  "Create a Task",
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}

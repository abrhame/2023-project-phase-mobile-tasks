import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart'; // Adjust the import path

class TaskDetails extends StatefulWidget {
  final Task task;

  TaskDetails({required this.task});

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  late TextEditingController _titleController = new TextEditingController();
  late TextEditingController _descriptionController =
      new TextEditingController();
  late TextEditingController _dateTimeController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

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
        title: const Text('Task Details'),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: const Icon(Icons.menu),
          )
        ],
      ),
      body: Column(
        children: [
          Image.asset('./assets/detail.png',
              height: 300, width: double.infinity),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Title",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _titleController,
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontWeight: FontWeight.normal),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "${widget.task.title}",
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const Text(
                      "Description",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _descriptionController,
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontWeight: FontWeight.normal),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "${widget.task.description}",
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const Text(
                      "Due Date",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _dateTimeController,
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontWeight: FontWeight.normal),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "${widget.task.dueDate}",
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

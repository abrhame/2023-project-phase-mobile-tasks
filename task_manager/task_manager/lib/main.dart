import 'package:flutter/material.dart';

import 'package:task_manager/start_screen.dart';
import 'package:task_manager/create_new_task.dart';
import 'package:task_manager/task_list.dart';
import 'package:task_manager/models/dummy_data.dart';
import 'package:task_manager/task_detail.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Task Manager',
    home: StartScreen(), // Use a single task from dummyTasks
  ));
}

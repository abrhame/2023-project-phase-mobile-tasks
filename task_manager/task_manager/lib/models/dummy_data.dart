import "package:task_manager/models/task.dart";

DateTime now = DateTime.now();
List<Task> tasks = [
  Task("Task1", "first task", "$now", "completed"),
  Task("Task2", "second Task", "$now", "pending"),
  Task("Task3", "third Task", "$now", "completed"),
  Task("Task4", "fourth Task", "$now", "pending"),
];

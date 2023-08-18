import "package:task_manager/models/task.dart";

class ManageTask {
  List<Task> tasks = [];

  List<Task>? addTask(Task task) {
    tasks.add(task);
    return tasks;
  }

  List<Task> seeTasks() {
    return tasks;
  }

  Task getTask() {
    return tasks[tasks.length - 1];
  }

  List<Task> showTask(String status, List<Task> tasks) {
    List<Task> tasksList =
        tasks.where((task) => task.status == status).toList();
    return tasksList;
  }
}

import "dart:io";

class Task {
  String? title;
  String? description;
  String? dueDate;
  String? status;

  Task(String title, String description, String dueDate, String status) {
    this.title = title;
    this.description = description;
    this.dueDate = dueDate;
    this.status = status;
  }

  @override
  String toString() {
    return "Task(title: $title, description: $description, dueDate: $dueDate, status: $status)";
  }
}

class manageTask {
  List<Task> tasks = [];

  List<Task>? addTask(Task task) {
    tasks.add(task);
    return this.tasks;
  }

  List<Task> seeTasks() {
    return this.tasks;
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

String? operations() {
  print("Task Manager");
  print("");
  print("----------------------------------------------------");
  print("Pleas select one of the following");
  print("To add a new task -> enter 0");
  print("To view all tasks -> enter 1");
  print("To view only completed tasks -> enter 2");
  print("TO only pending tasks -> enter 3");
  print("To update a task -> enter 4");
  print("delete a task -> enter 5");
  print("To exit Task Manager -> enter any key ");
  String? option = stdin.readLineSync();
  print("----------------------------------------------------");
  return option;
}

void removeTask(String title, List<Task> tasks) {
  tasks.removeWhere((task) => task.title == title);
}

void updateTask(String taskToBeUpdated, String title, String description,
    String dueDate, String status, List<Task> tasks) {
  for (int i = 0; i < tasks.length; i++) {
    if (tasks[i].title == taskToBeUpdated) {
      tasks[i].title = title;
      tasks[i].description = description;
      tasks[i].dueDate = dueDate;
      tasks[i].status = status;
    }
  }
}

void stayInTaskManager(taskManger) {
  print("----------------------------------------------------");
  print("To continue with the task manager, enter 0: ");
  print("To exit Task Manager -> enter any key ");
  String? option = stdin.readLineSync();
  print("----------------------------------------------------");
  if (option == "0") {
    recurse(taskManger);
  } else {
    exit(0);
  }
}

void recurse(taskManger) {
  print("");
  print("");
  String? option = operations();

  if (option == "0") {
    print("please Enter the Title of the Task:");
    String? title = stdin.readLineSync();
    print("Please enter the Description of the Task: ");
    String? description = stdin.readLineSync();
    print("Please enter the due Date of the Task: ");
    String? dueDate = stdin.readLineSync();
    print("please enter the status of the Task: ");
    String? status = stdin.readLineSync();
    var task = new Task(title!, description!, dueDate!, status!);

    taskManger.addTask(task);
    print("successfully added task");
    print(taskManger.getTask());
    stayInTaskManager(taskManger);
  } else if (option == "1") {
    if (taskManger.seeTasks().length == 0) {
      print("no task found");
    } else {
      print(taskManger.seeTasks());
    }

    stayInTaskManager(taskManger);
  } else if (option == "2") {
    if (taskManger.seeTasks().length == 0) {
      print("no task found");
    } else {
      print(taskManger.showTask("completed", taskManger.seeTasks()));
    }

    stayInTaskManager(taskManger);
  } else if (option == "3") {
    if (taskManger.seeTasks().length == 0) {
      print("no task found");
    } else {
      print(taskManger.showTask("pending", taskManger.seeTasks()));
    }

    stayInTaskManager(taskManger);
  } else if (option == "4") {
    print("Please enter the title of the task you want to update");
    String? titleToBeUpdated = stdin.readLineSync();
    print("Please enter new title");
    String? titleToUpdate = stdin.readLineSync();
    print("Please enter the description of the task you want to update");
    String? descriptionToUpdate = stdin.readLineSync();
    print("Please enter the task due date you want to update ");
    String? dueDateToUpdate = stdin.readLineSync();
    print("Please enter the status  of the task you want to update");
    String? statusToUpdate = stdin.readLineSync();
    updateTask(titleToBeUpdated!, titleToUpdate!, descriptionToUpdate!,
        dueDateToUpdate!, statusToUpdate!, taskManger.seeTasks());
    print("successfully updated the task");
    stayInTaskManager(taskManger);
  } else if (option == "5") {
    print("Please enter the tite of the task you want to remove");
    String? titleToRemove = stdin.readLineSync();
    removeTask(titleToRemove!, taskManger.seeTasks());
    print("successfully removed task");
    stayInTaskManager(taskManger);
  } else {
    exit(0);
  }
}

void main() {
  var taskManger = new manageTask();
  recurse(taskManger);
}

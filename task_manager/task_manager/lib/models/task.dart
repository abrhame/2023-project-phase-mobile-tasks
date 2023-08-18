class Task {
  String? title;
  String? description;
  String? dueDate;
  String? status;

  Task(String this.title, String this.description, String this.dueDate,
      String this.status);

  @override
  String toString() {
    return "Task(title: $title, description: $description, dueDate: $dueDate, status: $status)";
  }
}

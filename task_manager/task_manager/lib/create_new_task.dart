import "package:flutter/material.dart";
import "package:task_manager/models/task.dart";
import "package:task_manager/models/task_manger.dart";
import "package:task_manager/widget/input_field.dart";

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController _dateController = new TextEditingController();
  var selectedTime = DateTime.now();

  Future<void> _selectTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedTime,
        firstDate: DateTime(2022),
        lastDate: DateTime(2030));

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        _dateController.text = selectedTime.toLocal().toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 255, 73, 73),
              ),
              onPressed: () {}),
          title: const Text(
            "Create new Task",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
          ]),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(children: [
          const InputField("Main Task Name"),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Due Date",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 73, 73),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                TextField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 73, 73), width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 73, 73), width: 2),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onTap: () => _selectTime(context),
                )
              ],
            ),
          ),
          const InputField("Description"),
          Container(
              margin: EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 255, 73, 73),
              ),
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Add Task",
                    style: TextStyle(color: Colors.white),
                  ))),
        ]),
      ),
    );
  }
}

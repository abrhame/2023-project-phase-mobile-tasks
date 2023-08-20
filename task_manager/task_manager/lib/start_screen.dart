import 'package:flutter/material.dart';
import 'package:task_manager/create_new_task.dart';
import 'package:task_manager/task_detail.dart';
import 'package:task_manager/task_list.dart';
import "package:task_manager/models/dummy_data.dart";

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset("./assets/home.png", width: double.infinity, height: 800),
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: TextButton(
            onPressed: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color.fromARGB(255, 0, 26, 255),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TaskList(tasks)));
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )),
      )
    ]));
  }
}

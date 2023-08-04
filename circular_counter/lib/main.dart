import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Circular counter"),
          centerTitle: true,
        ),
        body: CircularCounter(),
      ),
    );
  }
}

class CircularCounter extends StatefulWidget {
  @override
  _CircularCounterState createState() => _CircularCounterState();
}

class _CircularCounterState extends State<CircularCounter> {
  int _counter = 0;

  void _incrementCounter() {
    if (_counter == 10) {
      _counter = -1;
    }
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter == 0) {
      _counter = 11;
    }
    setState(() => _counter--);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _counter.toString(),
          style: const TextStyle(fontSize: 30),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _decrementCounter,
              child: const Icon(Icons.remove),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}

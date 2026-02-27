import 'package:flutter/material.dart';

class Task2Screen extends StatelessWidget {
  const Task2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 2: Margin & Padding"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Container(
          // 🔵 Margin (external space)
          margin: const EdgeInsets.symmetric(
            vertical: 50.0,
            horizontal: 10.0,
          ),
          // 🟣 Padding (internal space)
          padding: const EdgeInsets.all(20.0),
          // 🟠 Background
          color: Colors.amber,
          child: Container(
            // 🟢 Space only on LEFT
            margin: const EdgeInsets.only(left: 10),
            color: Colors.blue,
            child: const Text(
              "Hello Task 2",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
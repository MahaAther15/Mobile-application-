import 'package:flutter/material.dart';
// import 'task3.dart';
import 'task4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Task4Screen(),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyFlutterApp());
}

class MyFlutterApp extends StatelessWidget {
  const MyFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('classtask Lab1'),
          backgroundColor: Colors.purple,
        ),
        body: const Column(
          children: [
            Row(children: [SizedBox(width: 10), Text('Maha Ather')]),
          ],
        ),
      ),
    );
  }
}

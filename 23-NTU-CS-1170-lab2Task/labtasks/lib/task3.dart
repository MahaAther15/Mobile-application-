import 'package:flutter/material.dart';

class Task3Screen extends StatefulWidget {
  const Task3Screen({Key? key}) : super(key: key);

  @override
  State<Task3Screen> createState() => _Task3ScreenState();
}

class _Task3ScreenState extends State<Task3Screen> {
  final TextEditingController _controller = TextEditingController();
  String _displayText = "Enter something and press the button";

  void _updateText() {
    setState(() {
      if (_controller.text.isEmpty) {
        _displayText = "Please enter some text";
      } else {
        _displayText = _controller.text;
      }
    });
  }

  void _clearText() {
    setState(() {
      _controller.clear();
      _displayText = "Text cleared";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 3 Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _displayText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Text",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateText,
              child: const Text("Show Text"),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: _clearText,
              child: const Text("Clear"),
            ),
          ],
        ),
      ),
    );
  }
}
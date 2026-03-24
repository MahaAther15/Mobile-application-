import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Phase2App extends StatefulWidget {
  @override
  createState() => _Phase2AppState();
}

class _Phase2AppState extends State<Phase2App> {
  double value = 50.0; // initial value

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Phase 2 - Slider Task")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔷 Task 2.1: Value Text
            Text(
              "Value: ${value.toStringAsFixed(1)}",
              style: TextStyle(fontSize: 24),
            ),

            SizedBox(height: 20),

            // 🔷 Task 2.2: Material Slider
            Slider(
              min: 0.0,
              max: 100.0,
              divisions: 10,
              value: value,
              label: value.toStringAsFixed(1),
              onChanged: (newValue) {
                setState(() {
                  value = newValue;
                });
              },
            ),

            SizedBox(height: 20),

            // 🔷 Task 2.3: Cupertino Slider
            CupertinoSlider(
              min: 0.0,
              max: 100.0,
              value: value,
              onChanged: (newValue) {
                setState(() {
                  value = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

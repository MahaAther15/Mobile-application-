import 'package:flutter/material.dart';

class Phase3App extends StatefulWidget {
  @override
  createState() => _Phase3AppState();
}

class _Phase3AppState extends State<Phase3App> {
  double red = 0;
  double green = 0;
  double blue = 0;

  double boxSize = 150; // initial size

  // Convert RGB to HEX
  String getHexColor() {
    int r = red.toInt();
    int g = green.toInt();
    int b = blue.toInt();
    return "#${r.toRadixString(16).padLeft(2, '0')}"
            "${g.toRadixString(16).padLeft(2, '0')}"
            "${b.toRadixString(16).padLeft(2, '0')}"
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    Color currentColor = Color.fromRGBO(
      red.toInt(),
      green.toInt(),
      blue.toInt(),
      1,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Phase 3 - Mood & Color Mixer")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🎨 Preview Box with GestureDetector
            GestureDetector(
              onLongPress: () {
                print("Copied HEX: ${getHexColor()}");
              },
              onHorizontalDragUpdate: (details) {
                setState(() {
                  boxSize += details.delta.dx;

                  // limit size
                  if (boxSize < 50) boxSize = 50;
                  if (boxSize > 300) boxSize = 300;
                });
              },
              child: Container(
                width: boxSize,
                height: boxSize,
                color: currentColor,
              ),
            ),

            SizedBox(height: 20),

            // 🔴 Red Slider
            Text("Red: ${red.toInt()}"),
            Slider(
              min: 0,
              max: 255,
              value: red,
              activeColor: Colors.red,
              onChanged: (value) {
                setState(() {
                  red = value;
                });
              },
            ),

            // 🟢 Green Slider
            Text("Green: ${green.toInt()}"),
            Slider(
              min: 0,
              max: 255,
              value: green,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  green = value;
                });
              },
            ),

            // 🔵 Blue Slider
            Text("Blue: ${blue.toInt()}"),
            Slider(
              min: 0,
              max: 255,
              value: blue,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  blue = value;
                });
              },
            ),

            SizedBox(height: 10),

            // HEX display
            Text(
              "HEX: ${getHexColor()}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

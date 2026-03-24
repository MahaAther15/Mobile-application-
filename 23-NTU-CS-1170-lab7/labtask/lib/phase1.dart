import 'package:flutter/material.dart';
import 'dart:math';

class Phase1App extends StatefulWidget {
  @override
  createState() => _Phase1AppState();
}

class _Phase1AppState extends State<Phase1App> {
  Color boxColor = Colors.blue;
  double borderRadius = 0;

  Color getRandomColor() {
    return Color.fromARGB(
      255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    );
  }

  void resetBox() {
    setState(() {
      boxColor = Colors.blue;
      borderRadius = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Phase 1 - Gesture Box')),
        body: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                boxColor = getRandomColor();
              });
            },
            onDoubleTap: () {
              setState(() {
                borderRadius = borderRadius == 0 ? 100 : 0;
              });
            },
            onLongPress: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Resetting...")));
              resetBox();
            },
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

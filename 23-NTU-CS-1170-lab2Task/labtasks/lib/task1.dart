import 'package:flutter/material.dart';

// 1. Main function jo app ko start karega
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SafeContainerScreen(),
  ));
}

// 2. Aapki UI Screen class
class SafeContainerScreen extends StatelessWidget {
  const SafeContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple, // Aapne purple select kiya tha image mein
      body: SafeArea(
        child: Container(
          width: 250,
          height: 250,
          margin: const EdgeInsets.all(25.0),
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
          ),
          color: Colors.white,
          child: const Center(
            child: Text(
              'Safe Container',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
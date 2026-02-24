import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VerticalAxisScreen(),
    ),
  );
}

class VerticalAxisScreen extends StatelessWidget {
  const VerticalAxisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: Container(
          width: double.infinity, // Full width container
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Space icons evenly vertically
            crossAxisAlignment:
                CrossAxisAlignment.end, // Align icons to the right
            children: [
              const Icon(Icons.favorite, size: 50, color: Colors.red),
              const SizedBox(
                height: 60,
              ), // Custom spacing between first and second icon
              const Icon(Icons.thumb_up, size: 50, color: Colors.blue),
              const Icon(Icons.share, size: 50, color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}

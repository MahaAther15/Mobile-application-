import 'package:flutter/material.dart';

class Task3Screen extends StatelessWidget {
  const Task3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 3: Profile UI"),
        backgroundColor: Colors.deepPurple,

        // CircleAvatar in AppBar (right side)
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: const AssetImage('assets/profile_local.png'),
              child: const Text(
                "AB", // fallback initials
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey.shade300,

          // Load network image
          backgroundImage: const NetworkImage('../profile.png'),
          // Fallback initials if image fails
          child: const Text(
            "XY",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

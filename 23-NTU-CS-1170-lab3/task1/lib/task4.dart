import 'package:flutter/material.dart';

class Task4Screen extends StatelessWidget {
  const Task4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 4: Cards & ListTile"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [

            // ✅ Card Version 1
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: const Text("Ali Khan"),
                subtitle: const Text("Reg. No: 12345"),
              ),
            ),

            const SizedBox(height: 20),

            // ✅ Card Version 2 (different color & trailing icon)
            Card(
              color: Colors.orange.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 8,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  child: Icon(Icons.school, color: Colors.white),
                ),
                title: const Text("Sara Ahmed"),
                subtitle: const Text("Reg. No: 67890"),
                trailing: const Icon(Icons.more_vert, color: Colors.black),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
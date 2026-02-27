import 'package:flutter/material.dart';

class Task4Screen extends StatelessWidget {
  const Task4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Final Alignment Challenge"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Parent Alignment
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔵 Blue Header Container
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text(
                "Status Panel Header",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // ✅ Exactly 20px vertical space
            const SizedBox(height: 20),

            // 🔴🟢 Button Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alignment Goal
              children: [

                // 🔴 Red Button
                Container(
                  height: 60,
                  width: 100,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                // 🟢 Green Button
                Container(
                  height: 60,
                  width: 100,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: const Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
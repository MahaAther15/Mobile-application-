import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomCardsScreen(),
    );
  }
}

class CustomCardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Cards"),
        backgroundColor: Colors.purple,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // -------- CARD 1 --------
            Card(
              color: Colors.blue[100],
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.home, size: 30, color: Colors.blue),
                    Icon(Icons.star, size: 40, color: Colors.orange),
                    Icon(Icons.favorite, size: 35, color: Colors.red),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // -------- CARD 2 --------
            Card(
              color: Colors.green[100],
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(Icons.person, size: 30, color: Colors.green),
                    Icon(Icons.email, size: 40, color: Colors.purple),
                    Icon(Icons.phone, size: 35, color: Colors.teal),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // -------- CARD 3 --------
            Card(
              color: Colors.pink[100],
              elevation: 15,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.camera, size: 30, color: Colors.black),
                    Icon(Icons.music_note, size: 40, color: Colors.deepPurple),
                    Icon(Icons.settings, size: 35, color: Colors.brown),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
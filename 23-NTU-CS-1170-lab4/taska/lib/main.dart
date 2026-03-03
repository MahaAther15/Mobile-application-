import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeScaffold(),
    );
  }
}

class SafeScaffold extends StatelessWidget {
  const SafeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Header')),
      body: const SafeArea(child: MainLayout()),
    );
  }
}

////////////////////////////////////////////////////////////
/// ✅ MAIN LAYOUT (ONLY ONE TIME)
////////////////////////////////////////////////////////////

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  bool isFollowed = false;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const HeaderSection(),
        const SizedBox(height: 20),

        Card(
          elevation: 6,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: ListTile(
            leading: const Icon(Icons.favorite, color: Colors.red),
            title: const Text("Total Likes"),
            subtitle: Text("$score people liked this profile"),
          ),
        ),

        const SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isFollowed = !isFollowed;
                });
              },
              child: Text(isFollowed ? "Following" : "Follow"),
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {
                setState(() {
                  score++;
                });
              },
              icon: const Icon(Icons.favorite, color: Colors.red),
            ),
          ],
        ),

        const SizedBox(height: 20),

        const Expanded(child: BodySection()),
      ],
    );
  }
}

////////////////////////////////////////////////////////////
/// HEADER
////////////////////////////////////////////////////////////

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.blue,
          child: Icon(Icons.person, size: 50, color: Colors.white),
        ),
        SizedBox(height: 15),
        Text(
          "Maha Ather",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Flutter Developer",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}

////////////////////////////////////////////////////////////
/// BODY SECTION
////////////////////////////////////////////////////////////

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.all(10),
            color: Colors.lightBlue,
            child: const Center(
              child: Text(
                "Main Content",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.all(10),
            color: Colors.orange,
            child: const Center(
              child: Text("Sidebar", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}

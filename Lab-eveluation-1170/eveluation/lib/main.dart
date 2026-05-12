import 'package:flutter/material.dart';

final List<Map<String, String>> myClasses = [
  {
    "TimeSlot": "8:00-9:30 AM",
    "Subject Name": "Flutter DEV",
    "room Number": "2001",
  },
  {
    "TimeSlot": "9:30-10:30 AM",
    "Subject Name": "WEB DEV",
    "room Number": "2002",
  },
  {
    "TimeSlot": "10:00-11:30 AM",
    "Subject Name": "React DEV",
    "room Number": "200",
  },
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 22,
          ),
        ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: ScheduleScreen(
        isDark: _isDark,
        onThemeToggle: () {
          setState(() {
            _isDark = !_isDark;
          });
        },
      ),
    );
  }
}

class ScheduleScreen extends StatelessWidget {
  final bool isDark;
  final VoidCallback onThemeToggle;

  const ScheduleScreen({
    super.key,
    required this.isDark,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MySchedule"),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: onThemeToggle,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: myClasses.map((classData) {
            return Column(
              children: [
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListTile(
                    title: Text(classData["Subject Name"] ?? ""),
                    subtitle: Text(
                      "Time: ${classData["TimeSlot"]} \n Room No: ${classData["room Number"]}",
                    ),
                    leading: const Icon(Icons.class_),
                  ),
                ),
                const SizedBox(height: 15), 
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

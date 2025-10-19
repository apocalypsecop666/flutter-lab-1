import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lab 1",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        useMaterial3: true,
      ),
      home: const InteractiveCounterPage(),
    );
  }
}

class InteractiveCounterPage extends StatefulWidget {
  const InteractiveCounterPage({super.key});

  // @override
  // State<InteractiveCounterPage> createState() => _Inter
}
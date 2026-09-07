import 'package:flutter/material.dart';
import 'spalsh_screeen.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TO DO List App',

      home: const SpalshScreeen(),
    );
  }
}


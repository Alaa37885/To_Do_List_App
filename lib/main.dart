import 'package:flutter/material.dart';
import 'package:todo_aug_26/view/ui_screens/spalsh_screeen.dart';

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


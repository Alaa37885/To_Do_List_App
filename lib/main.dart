import 'package:flutter/material.dart';
import 'package:todo_aug_26/view/ui_screens/home_screen.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TO DO App',

      home: const HomeScreen(),
    );
  }
}


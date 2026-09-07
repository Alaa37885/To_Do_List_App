import 'package:flutter/material.dart';

class TodoModel {
  final String title;
  final String description;
  final String createdAt;
  final Color color;
  final List<String> checklist;

  TodoModel({
    required this.title,
    required this.description,
    required this.createdAt,
    required this.color,
    this.checklist = const [],
  });
}

final List<TodoModel> dummyTodos = [
  TodoModel(
    title: "Design UI App",
    description: "Make To-DO UI Design for NTI.",
    createdAt: "1 Sept 2021",
    color: const Color(0xffEA3F7E),
    checklist: [
      "login",
      "register",
      "home",
      "detail",
      "add",
      "edit",
      "delete",
      "profile",
    ],
  ),

  TodoModel(
    title: "Make UI Design",
    description: "Make Ui design for the mini project post figma link to the trello using ...",
    createdAt: "1 Sept 2021",
    color: const Color(0xffF99CB3),
    checklist: [],
  ),
];

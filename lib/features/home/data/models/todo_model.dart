import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_aug_26/features/home/domain/entities/todo_entity.dart';

class TodoModel extends Todo {
  final String id;
  final String? userId;
  final String todoTitle;
  final String todoDescription;
  final String deadline;
  final String img;
  final DateTime? createdAt;

  TodoModel({
    required this.id,
    this.userId,
    required this.todoTitle,
    required this.todoDescription,
    required this.deadline,
    required this.img,
    required this.createdAt,
  }) : super(
    title: todoTitle,
    deadline: deadline,
    description: todoDescription,
    image: img,
    id: id,
    userId: userId,
    createdAt: createdAt,
  );

  factory TodoModel.fromJson(Map<String, dynamic> map) =>
      TodoModel(
        id: map['id'] ?? '',
        userId: map['userId'],
        todoTitle: map['todo_title'] ?? '',
        todoDescription: map['todo_description'] ?? '',
        deadline: map['deadline'] ?? '',
        img: map['img'] ?? '',
        createdAt: map['createdAt'] != null ? (map['createdAt'] as Timestamp)
            .toDate():null,
      );
}

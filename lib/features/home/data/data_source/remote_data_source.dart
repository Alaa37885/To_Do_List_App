import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_aug_26/features/home/data/models/todo_model.dart';
import 'package:todo_aug_26/features/home/presentation/controllers/home_cubit/home_cubit.dart';
import 'package:todo_aug_26/features/home/domain/entities/todo_entity.dart';

class HomeRemoteDataSource {
  var firestore = FirebaseFirestore.instance;

  Future<String> createTodo(Todo todo) async {
    try {
      var doc = firestore.collection("todos").doc();

      await doc.set({
        "id": doc.id,
        "todo_title": todo.title,
        "todo_description": todo.description,
        "img": todo.image,
        "deadline": todo.deadline,
        "createdAt": DateTime.now(),
      });

      return "200";
    } catch (e) {
      // search how to handle firebase errors with use friendly messages
      return e.toString();
    }
  }

  Future<String> deleteTodo(String id) async {
    try {
      await firestore.collection("todos").doc(id).delete();
      return "200";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> updateTodo(Todo todo) async {
    try {
      await firestore.collection("todos").doc(todo.id).update({
        "todo_title": todo.title,
        "todo_description": todo.description,
        "img": todo.image,
        "deadline": todo.deadline,
      });
      return "200";
    } catch (e) {
      return e.toString();
    }
  }

  // low lvl implementation
  Future<List<Todo>> fetchTodos() async {
    try {
      var collection = await firestore.collection("todos").get();
      var docs = collection.docs;
      //modeling

      var data = docs.map((e) => TodoModel.fromJson(e.data())).toList();

      return data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

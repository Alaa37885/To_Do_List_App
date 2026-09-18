import 'package:todo_aug_26/features/home/presentation/controllers/home_cubit/home_cubit.dart';
import 'package:todo_aug_26/features/home/domain/entities/todo_entity.dart';

abstract class BaseHomeRepo {
  Future<String> createTodo(Todo todo);
  Future<List<Todo>> fetchTodos();
  Future<String> deleteTodo(String id);
  Future<String> updateTodo(Todo todo);
}

import 'package:todo_aug_26/features/home/data/data_source/remote_data_source.dart';
import 'package:todo_aug_26/features/home/domain/repository/base_home_repo.dart';
import 'package:todo_aug_26/features/home/presentation/controllers/home_cubit/home_cubit.dart';
import 'package:todo_aug_26/features/home/domain/entities/todo_entity.dart';

class HomeRepoImpl extends BaseHomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource = HomeRemoteDataSource();

  @override
  Future<String> createTodo(Todo todo) async {
    return homeRemoteDataSource.createTodo(todo);
  }

  // only logic here is switching between data sources , local and remote
  @override
  Future<List<Todo>> fetchTodos() {
    return homeRemoteDataSource.fetchTodos();
  }

  @override
  Future<String> deleteTodo(String id) {
    return homeRemoteDataSource.deleteTodo(id);
  }

  @override
  Future<String> updateTodo(Todo todo) {
    return homeRemoteDataSource.updateTodo(todo);
  }
}

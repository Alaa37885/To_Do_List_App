import 'package:todo_aug_26/features/home/data/repository/home_repo_impl.dart';
import 'package:todo_aug_26/features/home/domain/repository/base_home_repo.dart';
import 'package:todo_aug_26/features/home/domain/entities/todo_entity.dart';

class UpdateTodoUseCase {
  final BaseHomeRepo homeRepo = HomeRepoImpl();

  Future<String> updateTodo(Todo todo) {
    return homeRepo.updateTodo(todo);
  }
}

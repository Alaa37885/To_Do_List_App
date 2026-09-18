import 'package:todo_aug_26/features/home/data/repository/home_repo_impl.dart';
import 'package:todo_aug_26/features/home/domain/repository/base_home_repo.dart';
import 'package:todo_aug_26/features/home/presentation/controllers/home_cubit/home_cubit.dart';
import 'package:todo_aug_26/features/home/domain/entities/todo_entity.dart';

class CreateTodoUseCase {
  final BaseHomeRepo homeRepo = HomeRepoImpl();

  Future<String> createTodo(Todo todo) {
    return homeRepo.createTodo(todo);
  }
}

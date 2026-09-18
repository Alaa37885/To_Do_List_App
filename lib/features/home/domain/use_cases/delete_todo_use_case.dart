import 'package:todo_aug_26/features/home/data/repository/home_repo_impl.dart';
import 'package:todo_aug_26/features/home/domain/repository/base_home_repo.dart';

class DeleteTodoUseCase {
  final BaseHomeRepo homeRepo = HomeRepoImpl();

  Future<String> deleteTodo(String id) {
    return homeRepo.deleteTodo(id);
  }
}

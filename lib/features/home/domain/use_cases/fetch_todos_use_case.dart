import 'package:todo_aug_26/features/home/data/repository/home_repo_impl.dart' show HomeRepoImpl;
import 'package:todo_aug_26/features/home/domain/repository/base_home_repo.dart';
import 'package:todo_aug_26/features/home/presentation/controllers/home_cubit/home_cubit.dart';
import 'package:todo_aug_26/features/home/domain/entities/todo_entity.dart';

class FetchTodosUseCase {
  final BaseHomeRepo homeRepo = HomeRepoImpl();
  Future<List<Todo>> fetchTodos(){
    return homeRepo.fetchTodos();
  }
}
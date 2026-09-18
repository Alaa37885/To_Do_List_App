import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_aug_26/features/home/domain/entities/todo_entity.dart';
import 'package:todo_aug_26/features/home/domain/use_cases/create_todo_use_case.dart';
import 'package:todo_aug_26/features/home/domain/use_cases/fetch_todos_use_case.dart';
import 'package:todo_aug_26/features/home/domain/use_cases/delete_todo_use_case.dart';
import 'package:todo_aug_26/features/home/domain/use_cases/update_todo_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final CreateTodoUseCase _createTodoUseCase = CreateTodoUseCase();
  final FetchTodosUseCase _fetchTodosUseCase = FetchTodosUseCase();
  final DeleteTodoUseCase _deleteTodoUseCase = DeleteTodoUseCase();
  final UpdateTodoUseCase _updateTodoUseCase = UpdateTodoUseCase();

  void createTodo(Todo todo) async {
    emit(HomeCreateTodoLoading());

    var res = await _createTodoUseCase.createTodo(todo);
    if (res == '200') {
      emit(HomeCreateTodoSuccess());
    } else {
      emit(HomeCreateTodoFailure(message: res));
    }
  }

  void deleteTodo(String id) async {
    emit(HomeDeleteTodoLoading());
    var res = await _deleteTodoUseCase.deleteTodo(id);
    if (res == '200') {
      emit(HomeDeleteTodoSuccess());
    } else {
      emit(HomeDeleteTodoFailure(message: res));
    }
  }

  void updateTodo(Todo todo) async {
    emit(HomeUpdateTodoLoading());
    var res = await _updateTodoUseCase.updateTodo(todo);
    if (res == '200') {
      emit(HomeUpdateTodoSuccess());
    } else {
      emit(HomeUpdateTodoFailure(message: res));
    }
  }

  // this layer call useCases not other
  void fetchTodos() async {
    emit(HomeFetchTodosLoading());
    try {
      var res = await _fetchTodosUseCase.fetchTodos();
      emit(HomeFetchTodosSuccess(todos: res));
    } catch (e) {
      emit(HomeFetchTodosFailure(message:e.toString()));
    }
  }
}

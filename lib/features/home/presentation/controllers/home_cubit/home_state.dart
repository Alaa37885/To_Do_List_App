part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeCreateTodoLoading extends HomeState {}
final class HomeCreateTodoFailure extends HomeState {
  final String message;

  HomeCreateTodoFailure({required this.message});
}
final class HomeCreateTodoSuccess extends HomeState {}

final class HomeFetchTodosLoading extends HomeState {}
final class HomeFetchTodosFailure extends HomeState {
  final String message;

  HomeFetchTodosFailure({required this.message});
}
final class HomeFetchTodosSuccess extends HomeState {
  final List<Todo> todos;

  HomeFetchTodosSuccess({required this.todos});
}

final class HomeDeleteTodoLoading extends HomeState {}
final class HomeDeleteTodoFailure extends HomeState {
  final String message;
  HomeDeleteTodoFailure({required this.message});
}
final class HomeDeleteTodoSuccess extends HomeState {}

final class HomeUpdateTodoLoading extends HomeState {}
final class HomeUpdateTodoFailure extends HomeState {
  final String message;
  HomeUpdateTodoFailure({required this.message});
}
final class HomeUpdateTodoSuccess extends HomeState {}


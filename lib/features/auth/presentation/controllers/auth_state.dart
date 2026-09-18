part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSignUpLoading extends AuthState {}

final class AuthSignUpSuccess extends AuthState {}

final class AuthSignUpFailure extends AuthState {
  final String message;

  AuthSignUpFailure({required this.message});
}

final class AuthSignInLoading extends AuthState {}

final class AuthSignInSuccess extends AuthState {}

final class AuthSignInFailure extends AuthState {
  final String message;

  AuthSignInFailure({required this.message});
}

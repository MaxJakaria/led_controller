part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});
}

class AuthSuccess extends AuthState {
  final User uid;

  AuthSuccess({required this.uid});
}

final class AuthLoading extends AuthState {}

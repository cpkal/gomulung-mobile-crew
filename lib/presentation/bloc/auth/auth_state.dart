part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;

  AuthAuthenticated(this.user);

  @override
  List<Object> get props => [user];
}

final class AuthUnauthenticated extends AuthState {}

final class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object> get props => [message];
}

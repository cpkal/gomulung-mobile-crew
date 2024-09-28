part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class AuthRegisterEvent extends AuthEvent {
  final String name;
  final String phone_number;
  final String address;
  final String email;
  final String password;
  final File sim;
  final File ktp;
  final File stnk;

  AuthRegisterEvent({
    required this.name,
    required this.phone_number,
    required this.address,
    required this.email,
    required this.password,
    required this.sim,
    required this.ktp,
    required this.stnk,
  });

  @override
  List<Object> get props =>
      [name, phone_number, address, email, password, sim, ktp, stnk];
}

class AuthLogoutEvent extends AuthEvent {}

class AuthCheckEvent extends AuthEvent {}

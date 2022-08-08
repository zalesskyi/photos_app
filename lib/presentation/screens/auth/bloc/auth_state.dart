part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  String email = "";
  String password = "";
}

@immutable
class IdleAuthState extends AuthState {

  @override
  List<Object> get props => [email, password];
}

@immutable
class LoggedInAuthState extends AuthState {

  @override
  List<Object> get props => [];
}
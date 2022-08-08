part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {}

class EmailEntered extends AuthEvent {
  String email;

  EmailEntered(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordEntered extends AuthEvent {
  String password;

  PasswordEntered(this.password);

  @override
  List<Object> get props => [password];
}

class SaveCredentials extends AuthEvent {

  @override
  List<Object> get props => [];
}
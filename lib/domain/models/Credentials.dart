import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Credentials extends Equatable {

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];

  const Credentials(this.email, this.password);
}
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:photos_app/domain/models/Credentials.dart';

import '../../../../domain/usecases/get_credentials_usecase.dart';
import '../../../../domain/usecases/save_credentials_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final SaveCredentialsUseCase _saveCredentialsUseCase;
  final GetCredentialsUseCase _getCredentialsUseCase;

  AuthBloc(this._saveCredentialsUseCase, this._getCredentialsUseCase) : super(IdleAuthState()) {
    on<EmailEntered>(_onEmailEnteredEvent);
    on<PasswordEntered>(_onPasswordEntered);
    on<SaveCredentials>(_onSaveCredentialsEvent);
    _checkExistingCredentials();
  }

  void _onEmailEnteredEvent(EmailEntered event, Emitter<AuthState> emitter) {
    state.email = event.email;
  }

  void _onPasswordEntered(PasswordEntered event, Emitter<AuthState> emitter) {
    state.password = event.password;
  }

  void _onSaveCredentialsEvent(SaveCredentials event,
      Emitter<AuthState> emitter) {
    _saveCredentialsUseCase(Credentials(state.email, state.password))
        .whenComplete(() => {
          emit(LoggedInAuthState())
    });
  }

  void _checkExistingCredentials() async {
    Credentials? creds = await _getCredentialsUseCase();
    if (creds != null) emit(LoggedInAuthState());
  }
}

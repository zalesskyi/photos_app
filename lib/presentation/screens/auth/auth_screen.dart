import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_app/di/injector.dart';
import 'package:photos_app/presentation/screens/auth/auth_layout.dart';
import 'package:photos_app/presentation/screens/auth/bloc/auth_bloc.dart';

class AuthScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (BuildContext context) {
        return injector<AuthBloc>();
      },
      child: const AuthLayout(),
    );
  }
}
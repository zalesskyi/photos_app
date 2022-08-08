import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_app/presentation/main.dart';
import 'package:photos_app/presentation/screens/auth/bloc/auth_bloc.dart';


class AuthLayout extends StatelessWidget {
  const AuthLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthBloc>(context);
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    return BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  label: Text("Email"),
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (text) {
                  bloc.add(EmailEntered(text));
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  label: Text("Password"),
                ),
                obscureText: true,
                onChanged: (text) {
                  bloc.add(PasswordEntered(text));
                },
              ),
              addVerticalSpace(24),
              ElevatedButton(child: const Text("Submit"), onPressed: () {
                bloc.add(SaveCredentials());
              })
            ],
          ),
        ),
      )));
    }, listener: (context, state) {
      if (state is LoggedInAuthState) {
        Navigator.pushNamed(context, mediaScreenKey);
      }
    });
  }
}

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

import 'package:flutter/material.dart';
import 'package:photos_app/di/injector.dart';
import 'package:photos_app/presentation/screens/auth/auth_layout.dart';
import 'package:photos_app/presentation/screens/auth/auth_screen.dart';
import 'package:photos_app/presentation/screens/media/media_screen.dart';

const String authScreenKey = "AuthScreen";
const String mediaScreenKey = "MediaScreen";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case authScreenKey:
            return MaterialPageRoute(builder: (context) {
              return AuthScreen();
            });
          case mediaScreenKey:
            return MaterialPageRoute(builder: (context) {
              return MediaScreen();
            });
        }
      },
    );
  }
}